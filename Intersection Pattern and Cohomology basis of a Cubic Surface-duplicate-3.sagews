︠b6721823-2708-4f7e-940a-da6a5c495ca7i︠
%md
# Intersection pattern and Cohomology Basis of a Cubic Surface

This Sage worksheet performs a computation of the intersection pattern of the $27$ lines in a cubic surface $V(w^{3}-f)$ where $f=y^{2}z-x^{3}+xz^{2}$, along with an explicit choice of basis for its cohomology given by a sextuple of pairwise non-intersecting lines.

︡7addf461-c9b2-43f9-a855-b7fa84d4cb09︡{"done":true,"md":"# Intersection pattern and Cohomology Basis of a Cubic Surface\n\nThis Sage worksheet performs a computation of the intersection pattern of the $27$ lines in a cubic surface $V(w^{3}-f)$ where $f=y^{2}z-x^{3}+xz^{2}$, along with an explicit choice of basis for its cohomology given by a sextuple of pairwise non-intersecting lines."}
︠7858b996-fd39-4fa9-a054-975cb0b61a2fsi︠
%md First we import the packages that will be needed in this notebook.
︡0a5ad7e4-0062-4bd3-973a-13264f605a48︡{"md":"First we import the packages that will be needed in this notebook. "}︡{"done":true}
︠57237c16-0535-4e31-b396-c127d2f5bf30s︠
import itertools
import numpy
︡bb03d3e5-b4d9-4892-9571-07887b394dd8︡{"done":true}
︠c532a8dc-dfbc-47e1-aae5-77d39ab7e776si︠
%md Now, we initialize 'pair_rows' and $\zeta=e^{2\pi i/3}$. We create a dictionary whose elements are the roots of the polynomial $p(t)=3t^{4}-6t^{2}-1$. These roots correspond to the $x$-coordinate of the inflection points of $f$ distinct of $[0:0:1]$.
︡ebf0b525-c560-49bb-bd61-c3fb790aa364︡{"md":"Now, we initialize 'pair_rows' and $\\zeta=e^{2\\pi i/3}$. We create a dictionary whose elements are the roots of the polynomial $p(t)=3t^{4}-6t^{2}-1$. These roots correspond to the $x$-coordinate of the inflection points of $f$ distinct of $[0:0:1]$."}︡{"done":true}
︠27e0eae6-d3a7-43d0-89e9-139fafdf44f2s︠
pairs_rows = {}
zeta=-1/2+I*(sqrt(3)/2) # cube root of unity

# p : intersection of (original polynomial) and (determinant of the Hessian)
# we set the parameter lambda=0
# p = 3*t^4-6*t^2-1
# this is just the roots of p
alphas=[]
signs=[1, -1]
for sign in signs:
    alphas.append(sign*sqrt(1+(2*sqrt(3))/3))
for sign in signs:
    alphas.append(sign*I*sqrt(-1+(2*sqrt(3))/3))
︡3b2ee48e-1d46-447f-9909-485328e54c75︡{"done":true}
︠3f23ab76-a812-4130-9da5-8f0eca7a5f3bsi︠
%md For future reference, we will print the roots $\alpha$ of $p(t)=3t^{4}-6t^{2}-1$, along with the simplified $z$ and $y$ coefficients of the tangent lines at the inflections points with $x$-coordinate $\alpha$.
︡3a9a6878-0cc1-48ce-af07-bca9b23759b6︡{"md":"For future reference, we will print the roots $\\alpha$ of $p(t)=3t^{4}-6t^{2}-1$, along with the simplified $z$ and $y$ coefficients of the tangent lines at the inflections points with $x$-coordinate $\\alpha$."}︡{"done":true}
︠38281a12-55ce-4731-924e-bac14b4fb317s︠
print('---------------------------------')
print('- Roots determining flex points -')
print('---------------------------------')
print('')
print(alphas)
print('')
print('---------------------------')
print('- z-coordinate simplified -')
print('---------------------------')
print('')
for a in alphas:
    print((a^3+a).full_simplify())

print('')
D={}

print('---------------------------')
print('- y-coordinate simplified -')
print('---------------------------')
print('')
# for each alpha, we obtain the two roots r of
# its defining polynomial
for a in alphas:
    D[a]=[sqrt((a^2-1)*(a)).real()+sqrt((a^2-1)*(a)).imag()*I, -(sqrt((a^2-1)*(a)).real())-(sqrt((a^2-1)*(a)).imag())*I]
    print(D[a][0].full_simplify())
    print(D[a][1].full_simplify())
︡dfc8de29-1b8f-4b1e-a2d9-1b47f6efc635︡{"stdout":"---------------------------------\n"}︡{"stdout":"- Roots determining flex points -\n"}︡{"stdout":"---------------------------------\n"}︡{"stdout":"\n"}︡{"stdout":"[sqrt(2/3*sqrt(3) + 1), -sqrt(2/3*sqrt(3) + 1), I*sqrt(2/3*sqrt(3) - 1), -I*sqrt(2/3*sqrt(3) - 1)]\n"}︡{"stdout":"\n"}︡{"stdout":"---------------------------\n"}︡{"stdout":"- z-coordinate simplified -\n"}︡{"stdout":"---------------------------\n"}︡{"stdout":"\n"}︡{"stdout":"2/3*sqrt(2*sqrt(3) + 3)*(sqrt(3) + 1)"}︡{"stdout":"\n-2/3*sqrt(2*sqrt(3) + 3)*(sqrt(3) + 1)\n2/3*I*sqrt(2*sqrt(3) - 3)*(sqrt(3) - 1)\n-2/3*I*sqrt(2*sqrt(3) - 3)*(sqrt(3) - 1)\n"}︡{"stdout":"\n"}︡{"stdout":"---------------------------\n"}︡{"stdout":"- y-coordinate simplified -\n"}︡{"stdout":"---------------------------\n"}︡{"stdout":"\n"}︡{"stdout":"1/3*sqrt(3)*sqrt(2)*(2*sqrt(3) + 3)^(1/4)\n-1/3*sqrt(3)*sqrt(2)*(2*sqrt(3) + 3)^(1/4)\n1/3*I*sqrt(3)*sqrt(2)*(2*sqrt(3) + 3)^(1/4)"}︡{"stdout":"\n-1/3*I*sqrt(3)*sqrt(2)*(2*sqrt(3) + 3)^(1/4)\n-(1/3*I - 1/3)*sqrt(3)*(2*sqrt(3) - 3)^(1/4)\n(1/3*I - 1/3)*sqrt(3)*(2*sqrt(3) - 3)^(1/4)\n(1/3*I + 1/3)*sqrt(3)*(2*sqrt(3) - 3)^(1/4)"}︡{"stdout":"\n-(1/3*I + 1/3)*sqrt(3)*(2*sqrt(3) - 3)^(1/4)\n"}︡{"done":true}
︠75eb8047-8adf-4269-bbe1-c9b4f5f28bf8si︠
%md Now, we proceed to store the information of each of the 27 lines via pairs of rows, containing the coefficients of the defining linear equations for each line.
︡e3dc4b59-9fd9-4436-a51d-55c0568a6a95︡{"md":"Now, we proceed to store the information of each of the 27 lines via pairs of rows, containing the coefficients of the defining linear equations for each line."}︡{"done":true}
︠ab7a7e09-2e13-46da-b518-85bbb51594b3s︠
#this will count the 27 lines corresponding to the cubic
count=0

# for each alpha, we obtain the two y-coefficients
for a in alphas:
    for r in D[a]:
        # This is the line tangent at our cubic at the flex [a:r:1] (first row)
        q1 = [((-3*a^2+1).full_simplify()), (2*r.full_simplify()), (a*(a^2+1)).full_simplify(), 0]
        # This is the splitting of the preimage of this tangent line (which are these three hyperplanes in P3) (second row)
        q2 = [1, 0, -a, 1]
        q3 = [zeta, 0, -a*zeta, 1]
        q4 = [zeta.conjugate(), 0, -a*(zeta.conjugate()), 1]
        #
        # we store in pairs_rows the pair
        # of polynomials that define this subscheme
        #
        count+=1
        pairs_rows[count]=(q1,q2)
        #
        # we store in pairs_rows the pair
        # of polynomials that define this subscheme
        #
        count+=1
        pairs_rows[count]=(q1,q3)
        #
        # we store in pairs_rows the pair
        # of polynomials that define this subscheme
        #
        count+=1
        pairs_rows[count]=(q1,q4)


#########################################
# Special lines - Lines over flex point #
#########################################
#
# we store in pairs_rows the pair
# of polynomials that define this subscheme
#

# line number 25
count+=1
pairs_rows[count]=([0, 0, 1, 0],[1, 0, 0, 1])

# line number 26
count+=1
pairs_rows[count]=([0, 0, 1, 0],[zeta, 0, 0, 1])

# line number 27
count+=1
pairs_rows[count]=([0, 0, 1, 0],[zeta.conjugate(), 0, 0, 1])

print('----------------')
︡5e23e207-9a4e-49fe-8bea-71f8331fc186︡{"stdout":"----------------\n"}︡{"done":true}
︠39ff6158-5e1f-46dd-a1d9-e2ddd5a468afsi︠
%md Now that the 27 lines in question have been calculated via pairs of rows of length 4, we proceed to calculate the intersection pattern of theses lines. A pair of lines gives rise to a 4 by 4 matrix by considering each pair of rows assigned to each line. We employ the following principle: Two lines intersect iff the determinant of such matrix is 0. Furthermore, we can simplyfy this calculation by performing row reduction on this 4 by 4 matrix, and we need only consider a 3 by 3 minor, whose determinant we compute below. In the intersection pattern matrix, a 1 is showed if two lines intersect, a 0 is showed if two lines don't intersect, and the diagonal is simply filled with 2's.
︡01438c22-62fa-4875-870b-976ecba05745︡{"md":"Now that the 27 lines in question have been calculated via pairs of rows of length 4, we proceed to calculate the intersection pattern of theses lines. A pair of lines gives rise to a 4 by 4 matrix by considering each pair of rows assigned to each line. We employ the following principle: Two lines intersect iff the determinant of such matrix is 0. Furthermore, we can simplyfy this calculation by performing row reduction on this 4 by 4 matrix, and we need only consider a 3 by 3 minor, whose determinant we compute below. In the intersection pattern matrix, a 1 is showed if two lines intersect, a 0 is showed if two lines don't intersect, and the diagonal is simply filled with 2's."}︡{"done":true}
︠4696a209-4104-4d46-b4e2-3b70071d2898s︠
indexes=[i for i in range(1,28)]
matrix_info = {}
for pair in itertools.combinations(indexes, 2):
    indexA = pair[0]
    indexB = pair[1]
    # access to the 4 defining polynomials
    M=matrix([pairs_rows[indexA][0][:3], pairs_rows[indexB][0][:3], map(lambda x, y:x-y, pairs_rows[indexA][1][:3], pairs_rows[indexB][1][:3])])
    d=M.det()
    b=bool(d.full_simplify() == 0)

    if b == True :
        matrix_info[(indexA,indexB)]=1
    if b == False :
        matrix_info[(indexA, indexB)]=0

for i in indexes:
    matrix_info[(i,i)]=-1
    L=[]
    for j in indexes:
        if i>j:
            a=j
            b=i
        else:
            a=i
            b=j
        L.append(matrix_info[(a,b)])
    print(L)
︡f272e1ca-11af-4948-a822-d775eb3b06b6︡{"stdout":"[-1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0]\n[1, -1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0]\n[1, 1, -1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1]\n[1, 0, 0, -1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0]\n[0, 1, 0, 1, -1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0]\n[0, 0, 1, 1, 1, -1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1]\n[0, 1, 0, 0, 0, 1, -1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0]\n[0, 0, 1, 1, 0, 0, 1, -1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0]\n[1, 0, 0, 0, 1, 0, 1, 1, -1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1]\n[0, 0, 1, 0, 1, 0, 1, 0, 0, -1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0]\n[1, 0, 0, 0, 0, 1, 0, 1, 0, 1, -1, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0]\n[0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, -1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1]\n[0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, -1, 1, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0]\n[0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, -1, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0]\n[1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 1, -1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 0, 0, 1]\n[0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, -1, 1, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0]\n[1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, -1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0]\n[0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, -1, 0, 1, 0, 1, 0, 0, 0, 0, 1]\n[0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, -1, 1, 1, 1, 0, 0, 1, 0, 0]\n[1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, -1, 1, 0, 1, 0, 0, 1, 0]\n[0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 1, -1, 0, 0, 1, 0, 0, 1]\n[0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, -1, 1, 1, 1, 0, 0]\n[0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, -1, 1, 0, 1, 0]\n[1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 1, 1, -1, 0, 0, 1]\n[1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, -1, 1, 1]\n[0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 1, -1, 1]\n[0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 1, -1]\n"}︡{"done":true}
︠ba221b3c-50a0-41ea-87c2-c1c005697d6as︠
for sixtuple in itertools.combinations(indexes,6):
    value = True
    for pair in itertools.combinations(sixtuple,2):
        if matrix_info[pair] == 1:
            value=False
    if value == True:
        pw_nonint_lines=sixtuple
        print(sixtuple)
        # we stop after finding the first sixtuple
        break
# we are printing the defining polynomials
# of each subscheme of the tuple
# for elem in sixtuple:
    # print(pairs_rows[elem])
    # print('*****')
︡456ae295-eeb8-4984-8978-6f0e4d167d07︡{"stdout":"(1, 5, 7, 12, 14, 18)"}︡{"stdout":"\n"}︡{"done":true}
︠7a1d923f-de1b-45ed-8d43-f5e3ef8c48a9s︠
for i in indexes:
    print('Intersection of line '+str(i)+' with the lines from collection B.')
    print([matrix_info[min(i, n), max(i, n)] for n in pw_nonint_lines])
    print('')
︡9eee2e0f-e6bf-41ae-be89-54400ebad1bd︡{"stdout":"Intersection of line 1 with the lines from collection B.\n[-1, 0, 0, 0, 0, 0]\n\nIntersection of line 2 with the lines from collection B.\n[1, 1, 1, 1, 0, 1]\n\nIntersection of line 3 with the lines from collection B.\n[1, 0, 0, 0, 1, 0]\n\nIntersection of line 4 with the lines from collection B.\n[1, 1, 0, 1, 1, 1]\n\nIntersection of line 5 with the lines from collection B.\n[0, -1, 0, 0, 0, 0]\n\nIntersection of line 6 with the lines from collection B.\n[0, 1, 1, 0, 0, 0]\n\nIntersection of line 7 with the lines from collection B.\n[0, 0, -1, 0, 0, 0]\n\nIntersection of line 8 with the lines from collection B.\n[0, 0, 1, 0, 0, 1]\n\nIntersection of line 9 with the lines from collection B.\n[1, 1, 1, 1, 1, 0]\n\nIntersection of line 10 with the lines from collection B.\n[0, 1, 1, 1, 1, 1]\n\nIntersection of line 11 with the lines from collection B.\n[1, 0, 0, 1, 0, 0]\n\nIntersection of line 12 with the lines from collection B.\n[0, 0, 0, -1, 0, 0]\n\nIntersection of line 13 with the lines from collection B.\n[0, 0, 0, 1, 1, 0]\n\nIntersection of line 14 with the lines from collection B.\n[0, 0, 0, 0, -1, 0]\n\nIntersection of line 15 with the lines from collection B.\n[1, 1, 1, 0, 1, 1]\n\nIntersection of line 16 with the lines from collection B.\n[0, 1, 0, 0, 0, 1]\n\nIntersection of line 17 with the lines from collection B.\n[1, 0, 1, 1, 1, 1]\n\nIntersection of line 18 with the lines from collection B.\n[0, 0, 0, 0, 0, -1]\n\nIntersection of line 19 with the lines from collection B.\n[0, 1, 0, 1, 0, 0]\n\nIntersection of line 20 with the lines from collection B.\n[1, 0, 0, 0, 0, 1]\n\nIntersection of line 21 with the lines from collection B.\n[0, 0, 1, 0, 1, 0]\n\nIntersection of line 22 with the lines from collection B.\n[0, 0, 0, 0, 1, 1]\n\nIntersection of line 23 with the lines from collection B.\n[0, 0, 1, 1, 0, 0]\n\nIntersection of line 24 with the lines from collection B.\n[1, 1, 0, 0, 0, 0]\n\nIntersection of line 25 with the lines from collection B.\n[1, 0, 1, 0, 0, 0]\n\nIntersection of line 26 with the lines from collection B.\n[0, 1, 0, 0, 1, 0]\n\nIntersection of line 27 with the lines from collection B.\n[0, 0, 0, 1, 0, 1]\n\n"}︡{"done":true}
︠e8fd6dcd-07ae-4403-a99c-d4401872e9e6︠









