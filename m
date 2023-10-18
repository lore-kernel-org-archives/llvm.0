Received: from metis.whiteo.stw.pengutronix.de (metis.whiteo.stw.pengutronix.de [185.203.201.7])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 208E93E016
	for <llvm@lists.linux.dev>; Wed, 18 Oct 2023 20:46:22 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=pengutronix.de
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: from drehscheibe.grey.stw.pengutronix.de ([2a0a:edc0:0:c01:1d::a2])
	by metis.whiteo.stw.pengutronix.de with esmtps (TLS1.3:ECDHE_RSA_AES_256_GCM_SHA384:256)
	(Exim 4.92)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtDQh-0000gU-1z; Wed, 18 Oct 2023 22:46:11 +0200
Received: from [2a0a:edc0:0:900:1d::77] (helo=ptz.office.stw.pengutronix.de)
	by drehscheibe.grey.stw.pengutronix.de with esmtps  (TLS1.3) tls TLS_ECDHE_RSA_WITH_AES_256_GCM_SHA384
	(Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtDQf-002dSA-0e; Wed, 18 Oct 2023 22:46:09 +0200
Received: from ukl by ptz.office.stw.pengutronix.de with local (Exim 4.94.2)
	(envelope-from <ukl@pengutronix.de>)
	id 1qtDQe-001EpL-N1; Wed, 18 Oct 2023 22:46:08 +0200
Date: Wed, 18 Oct 2023 22:46:08 +0200
From: Uwe =?utf-8?Q?Kleine-K=C3=B6nig?= <u.kleine-koenig@pengutronix.de>
To: Devi Priya <quic_devipriy@quicinc.com>
Cc: agross@kernel.org, andersson@kernel.org, konrad.dybcio@linaro.org,
	lee@kernel.org, robh+dt@kernel.org,
	krzysztof.kozlowski+dt@linaro.org, conor+dt@kernel.org,
	thierry.reding@gmail.com, ndesaulniers@google.com, trix@redhat.com,
	baruch@tkos.co.il, linux-arm-msm@vger.kernel.org,
	devicetree@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, linux-pwm@vger.kernel.org, nathan@kernel.org
Subject: Re: [PATCH V15 2/4] dt-bindings: pwm: add IPQ6018 binding
Message-ID: <20231018204608.qyifcnnzgi2bgzn6@pengutronix.de>
References: <20231005160550.2423075-1-quic_devipriy@quicinc.com>
 <20231005160550.2423075-3-quic_devipriy@quicinc.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: multipart/signed; micalg=pgp-sha512;
	protocol="application/pgp-signature"; boundary="xtsetqyrpzzycxzw"
Content-Disposition: inline
In-Reply-To: <20231005160550.2423075-3-quic_devipriy@quicinc.com>
X-SA-Exim-Connect-IP: 2a0a:edc0:0:c01:1d::a2
X-SA-Exim-Mail-From: ukl@pengutronix.de
X-SA-Exim-Scanned: No (on metis.whiteo.stw.pengutronix.de); SAEximRunCond expanded to false
X-PTX-Original-Recipient: llvm@lists.linux.dev


--xtsetqyrpzzycxzw
Content-Type: text/plain; charset=iso-8859-1
Content-Disposition: inline
Content-Transfer-Encoding: quoted-printable

Hello,

On Thu, Oct 05, 2023 at 09:35:48PM +0530, Devi Priya wrote:
> DT binding for the PWM block in Qualcomm IPQ6018 SoC.
>=20
> Reviewed-by: Bjorn Andersson <bjorn.andersson@linaro.org>
> Reviewed-by: Krzysztof Kozlowski <krzysztof.kozlowski@linaro.org>
> Co-developed-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Baruch Siach <baruch.siach@siklu.com>
> Signed-off-by: Devi Priya <quic_devipriy@quicinc.com>
> ---
> v15:
>=20
>   No change
>=20
> v14:
>=20
>   Picked up the R-b tag
>=20
> v13:
>=20
>   Updated the file name to match the compatible
>  =20
>   Sorted the properties and updated the order in the required field
>=20
>   Dropped the syscon node from examples
>=20
> v12:
>=20
>   Picked up the R-b tag
>=20
> v11:
>=20
>   No change
>=20
> v10:
>=20
>   No change
>=20
> v9:
>=20
>   Add 'ranges' property to example (Rob)
>=20
>   Drop label in example (Rob)
>=20
> v8:
>=20
>   Add size cell to 'reg' (Rob)
>=20
> v7:
>=20
>   Use 'reg' instead of 'offset' (Rob)
>=20
>   Drop 'clock-names' and 'assigned-clock*' (Bjorn)
>=20
>   Use single cell address/size in example node (Bjorn)
>=20
>   Move '#pwm-cells' lower in example node (Bjorn)
>=20
>   List 'reg' as required
>=20
> v6:
>=20
>   Device node is child of TCSR; remove phandle (Rob Herring)
>=20
>   Add assigned-clocks/assigned-clock-rates (Uwe Kleine-K=F6nig)
>=20
> v5: Use qcom,pwm-regs for phandle instead of direct regs (Bjorn
>     Andersson, Kathiravan T)
>=20
> v4: Update the binding example node as well (Rob Herring's bot)
>=20
> v3: s/qcom,pwm-ipq6018/qcom,ipq6018-pwm/ (Rob Herring)
>=20
> v2: Make #pwm-cells const (Rob Herring)
>=20
>  .../bindings/pwm/qcom,ipq6018-pwm.yaml        | 45 +++++++++++++++++++
>  1 file changed, 45 insertions(+)
>  create mode 100644 Documentation/devicetree/bindings/pwm/qcom,ipq6018-pw=
m.yaml
>=20
> diff --git a/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml =
b/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
> new file mode 100644
> index 000000000000..6d0d7ed271f7
> --- /dev/null
> +++ b/Documentation/devicetree/bindings/pwm/qcom,ipq6018-pwm.yaml
> @@ -0,0 +1,45 @@
> +# SPDX-License-Identifier: (GPL-2.0-only OR BSD-2-Clause)
> +%YAML 1.2
> +---
> +$id: http://devicetree.org/schemas/pwm/qcom,ipq6018-pwm.yaml#
> +$schema: http://devicetree.org/meta-schemas/core.yaml#
> +
> +title: Qualcomm IPQ6018 PWM controller
> +
> +maintainers:
> +  - Baruch Siach <baruch@tkos.co.il>

Not being very fluent in dt and binding yaml I wonder if adding

	allOf:
	  - $ref: pwm.yaml#

would be beneficial?!

> +properties:
> +  compatible:
> +    const: qcom,ipq6018-pwm
> +
> +  reg:
> +    description: Offset of PWM register in the TCSR block.
> +    maxItems: 1
> +
> +  clocks:
> +    maxItems: 1
> +
> +  "#pwm-cells":
> +    const: 2

The driver only supports normal polarity. Is this a shortcoming of the
driver, or is the hardware incapable to do that, too?

If it's only the former I'd want #pwm-cells =3D <3> here. For ease of use
I'd not oppose if you pick #pwm-cells =3D <3> even if the hardware can
only do normal polarity.

> +
> +required:
> +  - compatible
> +  - reg
> +  - clocks
> +  - "#pwm-cells"
> +
> +additionalProperties: false
> +
> +examples:
> +  - |
> +    #include <dt-bindings/clock/qcom,gcc-ipq6018.h>
> +
> +    pwm: pwm@a010 {
> +        compatible =3D "qcom,ipq6018-pwm";
> +        reg =3D <0xa010 0x20>;
> +        clocks =3D <&gcc GCC_ADSS_PWM_CLK>;
> +        assigned-clocks =3D <&gcc GCC_ADSS_PWM_CLK>;
> +        assigned-clock-rates =3D <100000000>;
> +        #pwm-cells =3D <2>;
> +    };

Best regards
Uwe

--=20
Pengutronix e.K.                           | Uwe Kleine-K=F6nig            |
Industrial Linux Solutions                 | https://www.pengutronix.de/ |

--xtsetqyrpzzycxzw
Content-Type: application/pgp-signature; name="signature.asc"

-----BEGIN PGP SIGNATURE-----

iQEzBAABCgAdFiEEP4GsaTp6HlmJrf7Tj4D7WH0S/k4FAmUwRA8ACgkQj4D7WH0S
/k4+QAf/WN6mLqG3+DlwosYZcJESOcX2S6K+CSxJ+01EkCGvXaNAPnaNasVmGzCa
iWvYmgoRhuFYuzrppCsUER6+lrHZz/C4HfnOsQlsVfjRIm/Si4qelPWc0jKfvsQ9
EV82d4hR/X2OT0ujmOcJZvwTMaITfER4B+9lzkVE0NvDzUIxzjZRgLDUX1j75All
994dvdSy0b6x3NHnCuryt4ORwe8cIj866wXsJgrSC/Cg+9kyqW7UXWriTGQNAcfT
0cfY92KCimjFjqfCuanOyBBN+41jlwwaiUnsB4gx8ZEh1mFgE50OXX9QK8eEgzzl
56qTKAjNGv8LdOd+XgAiPuVPd0+6yg==
=Vd7V
-----END PGP SIGNATURE-----

--xtsetqyrpzzycxzw--
