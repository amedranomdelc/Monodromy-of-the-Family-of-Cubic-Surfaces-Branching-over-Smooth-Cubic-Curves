︠26cf71b0-3db6-4d32-b68c-4a76a26f0c51i︠
%md

# Line Intersection Pattern for the Hesse Normal Form of a Cubic Curve

This code computes the line intersection pattern of the lines in the cubic surface over the Hesse Normal Form of the cubic curve $f=y^{2}z-x^{3}+xz^{2}$. This computation is then used in the paper "Monodromy of the Family of Cubic Surfaces Branching over Smooth Cubic Curves" to compute the monodromy action coming from a Heissenberg group modulo 3 $\mathcal{H}_{3}(\mathbb{Z}/3\mathbb{Z})$.
︡6377efea-6e79-433f-88d3-d8f38e7a57f5︡{"done":true,"md":"\n# Line Intersection Pattern for the Hesse Normal Form of a Cubic Curve\n\nThis code computes the line intersection pattern of the lines in the cubic surface over the Hesse Normal Form of the cubic curve $f=y^{2}z-x^{3}+xz^{2}$. This computation is then used in the paper \"Monodromy of the Family of Cubic Surfaces Branching over Smooth Cubic Curves\" to compute the monodromy action coming from a Heissenberg group modulo 3 $\\mathcal{H}_{3}(\\mathbb{Z}/3\\mathbb{Z})$."}
︠cd4dbc35-e97e-437c-aae0-f9f7d52eb30csi︠
%md Let $f_{H}$ be the Hesse Normal form of $f$. We enumerate the lines in $V(w^{3}-f_{H})$ in correspondence to the lines in $V(w^{3}-f)$ in a manner that the lines with enumeration $\{3k+1, 3k+2, 3k+3\}$ lie over the corresponding inflection point of the lines with the same enumeration in the sage file "Intersection Pattern and Cohomology basis of a Cubic Surface". Note that the enumerations DO NOT COINCIDE. Nevertheless, the lines enumerated in this sage document by $(1, 5, 7, 12, 15, 16)$ coincide with those in the sage file "Monodromy of the Family of Cubic Surfaces Branching over Smooth Cubic Curves" enumerated by $(1, 5, 7, 12, 14, 18)$, and this allows us to havea precise correspondence between the $27$ lines in both surfaces $V(w^{3}-f_{H})$ and $V(w^{3}-f)$.
︡cf858650-4187-4bb3-a290-c837b62dbdec︡{"md":"Let $f_{H}$ be the Hesse Normal form of $f$. We enumerate the lines in $V(w^{3}-f_{H})$ in correspondence to the lines in $V(w^{3}-f)$ in a manner that the lines with enumeration $\\{3k+1, 3k+2, 3k+3\\}$ lie over the corresponding inflection point of the lines with the same enumeration in the sage file \"Intersection Pattern and Cohomology basis of a Cubic Surface\". Note that the enumerations DO NOT COINCIDE. Nevertheless, the lines enumerated in this sage document by $(1, 5, 7, 12, 15, 16)$ coincide with those in the sage file \"Monodromy of the Family of Cubic Surfaces Branching over Smooth Cubic Curves\" enumerated by $(1, 5, 7, 12, 14, 18)$, and this allows us to havea precise correspondence between the $27$ lines in both surfaces $V(w^{3}-f_{H})$ and $V(w^{3}-f)$."}︡{"done":true}
︠052389cc-22ec-4740-bcfe-c696767a0d1a︠
import itertools
import numpy



pairs_rows = {}

# cube root of unity
zeta=-1/2+I*(sqrt(3)/2)

#this will count the 27 lines corresponding to the cubic
count=0

# line number 1
count+=1
pairs_rows[count]=([0, 1, zeta.conjugate(), 0],[-1, 0, 0, 1])

# line number 2
count+=1
pairs_rows[count]=([0, 1, zeta.conjugate(), 0],[-zeta, 0, 0, 1])

# line number 3
count+=1
pairs_rows[count]=([0, 1, zeta.conjugate(), 0],[-zeta.conjugate(), 0, 0, 1])

# line number 4
count+=1
pairs_rows[count]=([0, 1, zeta, 0],[-1, 0, 0, 1])

# line number 5
count+=1
pairs_rows[count]=([0, 1, zeta, 0],[-zeta, 0, 0, 1])

# line number 6
count+=1
pairs_rows[count]=([0, 1, zeta, 0],[-zeta.conjugate(), 0, 0, 1])

# line number 7
count+=1
pairs_rows[count]=([1, 1, 0, 0],[0, 0, -1, 1])

# line number 8
count+=1
pairs_rows[count]=([1, 1, 0, 0],[0, 0, -zeta, 1])

# line number 9
count+=1
pairs_rows[count]=([1, 1, 0, 0],[0, 0, -zeta.conjugate(), 1])

# line number 10
count+=1
pairs_rows[count]=([1, 0, 1, 0],[0, -1, 0, 1])

# line number 11
count+=1
pairs_rows[count]=([1, 0, 1, 0],[0, -zeta, 0, 1])

# line number 12
count+=1
pairs_rows[count]=([1, 0, 1, 0],[0, -zeta.conjugate(), 0, 1])

# line number 13
count+=1
pairs_rows[count]=([1, zeta, 0, 0],[0, 0, -1, 1])

# line number 14
count+=1
pairs_rows[count]=([1, zeta, 0, 0],[0, 0, -zeta, 1])

# line number 15
count+=1
pairs_rows[count]=([1, zeta, 0, 0],[0, 0, -zeta.conjugate(), 1])

# line number 16
count+=1
pairs_rows[count]=([zeta.conjugate(), 0, 1, 0],[0, -1, 0, 1])

# line number 17
count+=1
pairs_rows[count]=([zeta.conjugate(), 0, 1, 0],[0, -zeta, 0, 1])

# line number 18
count+=1
pairs_rows[count]=([zeta.conjugate(), 0, 1, 0],[0, -zeta.conjugate(), 0, 1])

# line number 19
count+=1
pairs_rows[count]=([zeta, 0, 1, 0],[0, -1, 0, 1])

# line number 20
count+=1
pairs_rows[count]=([zeta, 0, 1, 0],[0, -zeta, 0, 1])

# line number 21
count+=1
pairs_rows[count]=([zeta, 0, 1, 0],[0, -zeta.conjugate(), 0, 1])

# line number 22
count+=1
pairs_rows[count]=([1, zeta.conjugate(), 0, 0],[0, 0, -1, 1])

# line number 23
count+=1
pairs_rows[count]=([1, zeta.conjugate(), 0, 0],[0, 0, -zeta, 1])

# line number 24
count+=1
pairs_rows[count]=([1, zeta.conjugate(), 0, 0],[0, 0, -zeta.conjugate(), 1])

# line number 25
count+=1
pairs_rows[count]=([0, 1, 1, 0],[-1, 0, 0, 1])

# line number 26
count+=1
pairs_rows[count]=([0, 1, 1, 0],[-zeta, 0, 0, 1])

# line number 27
count+=1
pairs_rows[count]=([0, 1, 1, 0],[-zeta.conjugate(), 0, 0, 1])

print('----------------')

indexes=[i for i in range(1,28)]
matrix_info = {}
for pair in itertools.combinations(indexes, 2):
    indexA = pair[0]
    indexB = pair[1]
    # access to the 4 defining polynomials
    M=matrix([pairs_rows[indexA][0][:3], pairs_rows[indexB][0][:3], map(lambda x, y:x-y, pairs_rows[indexA][1][:3], pairs_rows[indexB][1][:3])])
    d=M.det()
    b=bool(d == 0)

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
︡09a363f3-1763-4277-bab0-fbc0dbe057c7︡{"stdout":"----------------\n"}︡{"stdout":"[-1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0]\n[1, -1, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0]\n[1, 1, -1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1]\n[1, 0, 0, -1, 1, 1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0]\n[0, 1, 0, 1, -1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0]\n[0, 0, 1, 1, 1, -1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1]\n[0, 1, 0, 0, 0, 1, -1, 1, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0]\n[0, 0, 1, 1, 0, 0, 1, -1, 1, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0]\n[1, 0, 0, 0, 1, 0, 1, 1, -1, 0, 0, 1, 0, 0, 1, 0, 1, 0, 1, 0, 0, 0, 0, 1, 0, 0, 1]\n[0, 0, 1, 0, 1, 0, 1, 0, 0, -1, 1, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0]\n[1, 0, 0, 0, 0, 1, 0, 1, 0, 1, -1, 1, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0]\n[0, 1, 0, 1, 0, 0, 0, 0, 1, 1, 1, -1, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 0, 1]\n[1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, -1, 1, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1]\n[0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, -1, 1, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0]\n[0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 0, 0, 1, 1, -1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0]\n[0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 0, -1, 1, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1]\n[0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 1, 0, 0, 1, 0, 1, -1, 1, 0, 1, 0, 1, 0, 0, 1, 0, 0]\n[1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 1, -1, 0, 0, 1, 0, 1, 0, 0, 1, 0]\n[1, 0, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, -1, 1, 1, 1, 0, 0, 0, 1, 0]\n[0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, -1, 1, 0, 1, 0, 0, 0, 1]\n[0, 0, 1, 0, 1, 0, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, -1, 0, 0, 1, 1, 0, 0]\n[0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 0, 1, 1, 0, 0, 0, 1, 0, 1, 0, 0, -1, 1, 1, 0, 1, 0]\n[1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 0, 0, 0, 1, 0, 1, 0, 1, -1, 1, 0, 0, 1]\n[0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 0, 0, 0, 1, 1, 0, 0, 0, 0, 1, 1, 1, -1, 1, 0, 0]\n[1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, -1, 1, 1]\n[0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 1, -1, 1]\n[0, 0, 1, 0, 0, 1, 0, 0, 1, 0, 0, 1, 1, 0, 0, 1, 0, 0, 0, 1, 0, 0, 1, 0, 1, 1, -1]\n"}︡{"done":true}
︠e2ea5e6f-69b3-472f-b643-434ebe51ef3es︠
for i in indexes:
    print(i)
    print([matrix_info[min(i, 1), max(i, 1)], matrix_info[min(i, 5), max(i, 5)], matrix_info[min(i, 7), max(i, 7)], matrix_info[min(i, 12), max(i, 12)], matrix_info[min(i, 15), max(i, 15)], matrix_info[min(i, 16), max(i, 16)]])
︡55f8f0a6-964e-4966-b77c-44b3fcd3283f︡{"stdout":"1\n[2, 0, 0, 0, 0, 0]\n2\n[1, 1, 1, 1, 0, 1]\n3\n[1, 0, 0, 0, 1, 0]\n4\n[1, 1, 0, 1, 1, 1]\n5\n[0, 2, 0, 0, 0, 0]\n6\n[0, 1, 1, 0, 0, 0]\n7\n[0, 0, 2, 0, 0, 0]\n8\n[0, 0, 1, 0, 0, 1]\n9\n[1, 1, 1, 1, 1, 0]\n10\n[0, 1, 1, 1, 1, 1]\n11\n[1, 0, 0, 1, 0, 0]\n12\n[0, 0, 0, 2, 0, 0]\n13\n[1, 1, 1, 0, 1, 1]\n14\n[0, 0, 0, 1, 1, 0]\n15\n[0, 0, 0, 0, 2, 0]\n16\n[0, 0, 0, 0, 0, 2]\n17\n[0, 1, 0, 0, 0, 1]\n18\n[1, 0, 1, 1, 1, 1]\n19\n[1, 0, 0, 0, 0, 1]\n20\n[0, 0, 1, 0, 1, 0]\n21\n[0, 1, 0, 1, 0, 0]\n22\n[0, 0, 1, 1, 0, 0]\n23\n[1, 1, 0, 0, 0, 0]\n24\n[0, 0, 0, 0, 1, 1]\n25\n[1, 0, 1, 0, 0, 0]\n26\n[0, 1, 0, 0, 1, 0]\n27\n[0, 0, 0, 1, 0, 1]\n"}︡{"done":true}
︠b4bda155-e110-436f-b8c0-79edccc0db47︠









