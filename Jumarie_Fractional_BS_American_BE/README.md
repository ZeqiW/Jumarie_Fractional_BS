# Wyss_Fractional_BS_American_BE
This Matlab File is aimed at solving Wyss Fractional BS formula (2000) using Numerical Analysis (Fractional Backward Euler)

I use Vanilla Put Option as an example, and set the boundary value to satisfy American Put Option condition. For American Condition, I introduce an additional method called Projected Back Substitution. 

In this file,

FracAm_Put_Be.m is the main function solving American Put Option under Wyss Fractional BS formula with Projected Back Substitution.

Other .m files are used in the main function.