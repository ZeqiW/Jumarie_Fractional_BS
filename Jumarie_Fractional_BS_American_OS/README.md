# Jumarie_Fractional_BS_American_OS

This Matlab File is aimed at solving Jumarie Fractional BS formula (2010) using Numerical Analysis (Fractional Backward Euler)

I use Vanilla Put Option as an example, and set the boundary value to satisfy American Put Option condition. For American Condition, I introduce an additional method called Operator Splitting.

In this file,

FracAm_Put_OS.m is the main function solving American Put Option under Wyss Fractional BS formula with Operator Splitting method.

Other .m files are used in the main function.

Frac_OS_veri.m is used to calculate the order of accuracy.
