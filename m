Received: from mail-lf1-f49.google.com (mail-lf1-f49.google.com [209.85.167.49])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 438253C3E
	for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 11:47:10 +0000 (UTC)
Received: by mail-lf1-f49.google.com with SMTP id u13so13494341lfn.5
        for <llvm@lists.linux.dev>; Tue, 12 Jul 2022 04:47:10 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linaro.org; s=google;
        h=mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=UgT30bC5T+elvizr+rDtBDdzHu6utcbtXAwHMvUgsz8=;
        b=e7RD3BLzQcsIlkVVm0wCXZdT1Q55WRmEmccyvgtuEpp2Qo64V5NvzMj2lS5kTBzyIN
         h0tupRZP66xFz5YAVF+K+zuEKFqW+P8GQ76CIGI1U8SOZGidpW4BLQ1kV1FBK+drb3Om
         Atib5VxfiORJa2ehvJh4zb9GuVuGl6JbaSFg/qIGxuEyr4eKQnpMjjT6wv4SKatFqoXw
         6/+j0Dn7G9oeW7z32GMxu/xnDMnOdRt7+ms+IdrxZel85LliY2oUYT6+6RerPiv7Y7MQ
         Yf3U6LdgPvgY+DQAvdJRRBdqurNemiNO8tR6eJIOF0yreWpAkP/jLBZADIWBL1jLbKn9
         Qwwg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=x-gm-message-state:mime-version:subject:from:in-reply-to:date:cc
         :content-transfer-encoding:message-id:references:to;
        bh=UgT30bC5T+elvizr+rDtBDdzHu6utcbtXAwHMvUgsz8=;
        b=zWQcva39qGAgWZhRNB/61+QEKvGYfPP0deRBr1MRasI/jI4OYcO9dYOEQM8ta2SwOp
         XDdxra+KBPKAVAMIqrnE7GZ0Bz1mnA7hT6IykIrTaMVELehhiSLI9J3LtiLuJYXKuh+n
         iPAAjQX54q0Jt39CaVAEWm2tzdyKBHU70M4jO9d3yBqHZl+mJ6Um6jh1DTikqhQ5CMSd
         aRTj9r/Jk3bK/kFCVNcB8aQJG9riPb9h7LW0muIobAh4gRocMvhuzugCOg/RVHK2JcKK
         u/xHFNFFucYWJ2OlwWoqEoxubASxWaOhof5FBC2sGnK1R/5Nc4AStmbYV/rBjkQcYjRd
         0yVw==
X-Gm-Message-State: AJIora9NMueLrB7NtkcwB72lvLssGB0/07eMbhHFYUoVQ/oc/1btfUCh
	aix5O+G5IxX8Y5HPTi3mrcVj
X-Google-Smtp-Source: AGRyM1tHDbfRY+4AfOcM6z4kVeFyEPeRZ6HiMnp4I/NH1hbvS+ZYO6E1rcmZomak5YYSypo0qftB7w==
X-Received: by 2002:a05:6512:3e0e:b0:489:c79f:4019 with SMTP id i14-20020a0565123e0e00b00489c79f4019mr12067037lfv.68.1657626428175;
        Tue, 12 Jul 2022 04:47:08 -0700 (PDT)
Received: from smtpclient.apple ([185.30.228.158])
        by smtp.gmail.com with ESMTPSA id c8-20020a056512074800b004795d64f37dsm2143683lfs.105.2022.07.12.04.47.07
        (version=TLS1_2 cipher=ECDHE-ECDSA-AES128-GCM-SHA256 bits=128/128);
        Tue, 12 Jul 2022 04:47:07 -0700 (PDT)
Content-Type: text/plain;
	charset=us-ascii
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (Mac OS X Mail 14.0 \(3654.120.0.1.13\))
Subject: Re: [TCWG CI] Regression caused by linux: lib/bitmap: Make length
 parameter `len` unsigned
From: Maxim Kuvyrkov <maxim.kuvyrkov@linaro.org>
In-Reply-To: <1791141562.180.1657258946129@jenkins.jenkins>
Date: Tue, 12 Jul 2022 14:47:06 +0300
Cc: Paul Menzel <pmenzel@molgen.mpg.de>,
 llvm@lists.linux.dev,
 arnd@linaro.org
Content-Transfer-Encoding: quoted-printable
Message-Id: <18ADC767-346E-4C44-93A3-DF3D1811F6CB@linaro.org>
References: <1791141562.180.1657258946129@jenkins.jenkins>
To: Yury Norov <yury.norov@gmail.com>
X-Mailer: Apple Mail (2.3654.120.0.1.13)

Hi All,

Excuse the noise.  This report is for Yury's development bitmap branch, =
and I forgot to update email preference to not spam llvm@.

Hi Yury,

FYI.

--
Maxim Kuvyrkov
https://www.linaro.org

> On 8 Jul 2022, at 08:42, ci_notify@linaro.org wrote:
>=20
> [TCWG CI] Regression caused by linux: lib/bitmap: Make length =
parameter `len` unsigned:
> commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> Author: Paul Menzel <pmenzel@molgen.mpg.de>
>=20
>    lib/bitmap: Make length parameter `len` unsigned
>=20
> Results regressed to
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 547
> # First few build errors in logs:
> # 00:01:34 lib/bitmap.c:351:6: error: conflicting types for =
'__bitmap_set'
> # 00:01:34 make[1]: *** [lib/bitmap.o] Error 1
> # 00:01:37 make: *** [lib] Error 2
>=20
> from
> # reset_artifacts:
> -10
> # build_abe binutils:
> -9
> # build_kernel_llvm:
> -5
> # build_abe qemu:
> -2
> # linux_n_obj:
> 564
> # linux build successful:
> all
>=20
> THIS IS THE END OF INTERESTING STUFF.  BELOW ARE LINKS TO BUILDS, =
REPRODUCTION INSTRUCTIONS, AND THE RAW COMMIT.
>=20
> This commit has regressed these CI configurations:
> - tcwg_kernel/llvm-release-arm-norov-allnoconfig
>=20
> First_bad build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/build-aaa4ab5ec04480fd0c16c7452d28444c862b=
2b87/
> Last_good build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/build-dc34d5036692c614eef23c1130ee42a201c3=
16bf/
> Baseline build: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/build-baseline/
> Even more details: =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/
>=20
> Reproduce builds:
> <cut>
> mkdir investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> cd investigate-linux-aaa4ab5ec04480fd0c16c7452d28444c862b2b87
>=20
> # Fetch scripts
> git clone https://git.linaro.org/toolchain/jenkins-scripts
>=20
> # Fetch manifests and test.sh script
> mkdir -p artifacts/manifests
> curl -o artifacts/manifests/build-baseline.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/manifests/build-baseline.sh --fail
> curl -o artifacts/manifests/build-parameters.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/manifests/build-parameters.sh --fail
> curl -o artifacts/test.sh =
https://ci.linaro.org/job/tcwg_kernel-llvm-bisect-llvm-release-arm-norov-a=
llnoconfig/1/artifact/artifacts/test.sh --fail
> chmod +x artifacts/test.sh
>=20
> # Reproduce the baseline build (build all pre-requisites)
> ./jenkins-scripts/tcwg_kernel-build.sh @@ =
artifacts/manifests/build-baseline.sh
>=20
> # Save baseline build state (which is then restored in =
artifacts/test.sh)
> mkdir -p ./bisect
> rsync -a --del --delete-excluded --exclude /bisect/ --exclude =
/artifacts/ --exclude /linux/ ./ ./bisect/baseline/
>=20
> cd linux
>=20
> # Reproduce first_bad build
> git checkout --detach aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> ../artifacts/test.sh
>=20
> # Reproduce last_good build
> git checkout --detach dc34d5036692c614eef23c1130ee42a201c316bf
> ../artifacts/test.sh
>=20
> cd ..
> </cut>
>=20
> Full commit (up to 1000 lines):
> <cut>
> commit aaa4ab5ec04480fd0c16c7452d28444c862b2b87
> Author: Paul Menzel <pmenzel@molgen.mpg.de>
> Date:   Thu Jul 7 23:50:52 2022 +0200
>=20
>    lib/bitmap: Make length parameter `len` unsigned
>=20
>    The length is non-negative, so make it unsigned, and adapt while
>    condition accordingly.
>=20
>    Signed-off-by: Paul Menzel <pmenzel@molgen.mpg.de>
>    Signed-off-by: Yury Norov <yury.norov@gmail.com>
> ---
> lib/bitmap.c | 4 ++--
> 1 file changed, 2 insertions(+), 2 deletions(-)
>=20
> diff --git a/lib/bitmap.c b/lib/bitmap.c
> index b18e31ea6e66..0746beb336df 100644
> --- a/lib/bitmap.c
> +++ b/lib/bitmap.c
> @@ -348,14 +348,14 @@ int __bitmap_weight(const unsigned long *bitmap, =
unsigned int bits)
> }
> EXPORT_SYMBOL(__bitmap_weight);
>=20
> -void __bitmap_set(unsigned long *map, unsigned int start, int len)
> +void __bitmap_set(unsigned long *map, unsigned int start, unsigned =
int len)
> {
> 	unsigned long *p =3D map + BIT_WORD(start);
> 	const unsigned int size =3D start + len;
> 	int bits_to_set =3D BITS_PER_LONG - (start % BITS_PER_LONG);
> 	unsigned long mask_to_set =3D BITMAP_FIRST_WORD_MASK(start);
>=20
> -	while (len - bits_to_set >=3D 0) {
> +	while (len >=3D bits_to_set) {
> 		*p |=3D mask_to_set;
> 		len -=3D bits_to_set;
> 		bits_to_set =3D BITS_PER_LONG;
> </cut>

