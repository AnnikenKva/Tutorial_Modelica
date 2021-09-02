within ;
package Tutorial_Object_Hydro "Course Files of the tutorial"

  package Tutorial1

    model SimplePendulum "First simple version"

      constant Real g(unit="m/s2")=9.81 "Gravitational Constant";     // constants are values that shoul not change
      parameter Real L(unit="m")=1 "Length of the pendulum";    // parameter are values that can be changed, but should not change during the simulation
      Real theta(unit="rad",  start=0.1) "angle of the pendulum";
      Real dertheta "Helping variable for 2nd derivative";       // Must be defined for later use.

    equation
      dertheta = der(theta);  // Modelica does not support double derivatives. This is a way around
      der(dertheta) = - g/L * sin(theta);  //sin, cos etc. are built in functions

      annotation (experiment(StopTime=10));
    end SimplePendulum;

    model SimplePendulumSIunits "Model using SI units"

      constant Modelica.SIunits.Acceleration g=9.81 "Gravitational Constant";     // constants are values that shoul not change
      parameter Modelica.SIunits.Length L=1 "Length of the pendulum";    // parameter are values that can be changed, but should not change during the simulation
      Modelica.SIunits.Angle theta(start=0.1) "angle of the pendulum";
      Real dertheta "Helping variable for 2nd derivative";       // Must be defined for later use.

    equation
      dertheta = der(theta);  // Modelica does not support double derivatives. This is a way around
      der(dertheta) = - g/L * sin(theta);  //sin, cos etc. are built in functions

      annotation (experiment(StopTime=10));
    end SimplePendulumSIunits;

    model SimplePendulumUsingImports "Model using imports"
      import SI = Modelica.SIunits;

      constant SI.Acceleration g=9.81 "Gravitational Constant";
      parameter SI.Length L=1 "Length of the pendulum";
      SI.Angle theta(start=0.1) "angle of the pendulum";
      Real dertheta "Helping variable for 2nd derivative";

    equation
      dertheta = der(theta);  // Modelica does not support double derivatives. This is a way around
      der(dertheta) = - g/L * sin(theta);  //sin, cos etc. are built in functions

    end SimplePendulumUsingImports;
  end Tutorial1;
  annotation (uses(Modelica(version="3.2.3")));
end Tutorial_Object_Hydro;
