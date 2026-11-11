Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=209.85.221.47
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1794423684;
	b=tm4kT5QjjTugzKCuZ1Pd5xPP8jzTl6PutijwM2wneCoViKlWFjQDyRakOOVj1sMIlstm
	 q/565jaaf3ub62RBOsMtTncO3PXyeCxki0/gaM4CW5piVmMnyWvCliQjaiVGHCmBqio+l
	 g08ElZLjFwapRDhxKHG7LeXluPdJDKzs0/9FF5ZbPEiQoCLHkvJCkYxYt9/ePjTwEn541
	 /xzdN0fqGRg3fBzTEf7CSJlx4hEsYT8gl09TA529POCaPhk6Ad4ZEl1NXeKd89qbNlGE/
	 R2D7LOINruuzx4zhpfUGOKkq7+ABkaMEKA3R5eQHQvcs/E3Op4XNAk8zv0FqadE1ipA==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1794423684;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Forwarded-Encrypted:X-Gm-Message-State:X-Gm-Gg:X-Received:Received:
	 Sender:Message-ID:Date:MIME-Version:User-Agent:From:Subject:To:Cc:
	 References:Content-Language:In-Reply-To:Content-Type;
	bh=ibbZxZ0AUA89ICzojImIUdj4mBfVP5cQ49POtiuj0Pg=;
	b=1NEmw30qmvbWnuhDOVrdGq54NTlyxY0+bA0mT7Pv4chxt9tkHb58LqpVg961Ey96BgY6
	 5Ih94xoY7UPp+UbbckNwW7amUpJZddkrj747XNP9LlMajTi5gpiV2meUrXPXuigcSrFJL
	 LUWTviaTD5kUKsKnF+4PFHwSwF2UKjeP9z8sd3+zw0+fyK/hLwDtgCyLW35ZhJlfyJdR5
	 7O9yLlYc0roPhQWXHAKCxrUMHxkRnoMYeCEFBI5zwXDeMQcHRXpfI3HMmTurJskBgSZLd
	 O9d5GbfirXB+HavlqFnGnlfJhNuu+RpV4HuDdEocDk8XTawgOfyRgO6599Kypsj7DdA==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dmarc=pass header.from=gmail.com;
	spf=pass smtp.mailfrom=gmail.com;
	dkim=pass header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=av58eYxx;
	arc=none smtp.remote-ip=209.85.221.47
Received: from mail-wr1-f47.google.com (mail-wr1-f47.google.com [209.85.221.47])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A4A9D606A321
	for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 19:01:23 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org A4A9D606A321
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.a=rsa-sha256 header.s=20260707 header.b=av58eYxx
Received: by mail-wr1-f47.google.com with SMTP id ffacd0b85a97d-4918c2d727fso1963900f8f.3
        for <llvm@lists.linux.dev>; Wed, 11 Nov 2026 11:01:23 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20260707; t=1794423682; x=1795028482; darn=lists.linux.dev;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:from:to:cc
         :subject:date:message-id:reply-to:content-type;
        bh=ibbZxZ0AUA89ICzojImIUdj4mBfVP5cQ49POtiuj0Pg=;
        b=av58eYxxBqwWe8iaSp/xKGb84qCA4N9Wo3N3PCAuuh1Zcwgmy3i0DT7myZcswQ25KU
         R7TNVWLOd3eFbm6aVc0rqZvvQ2Vp1WUBwfpR3SuE5JfPUpjJEtWGVcd8SGVsAevLvU8r
         5R7LK4FOZa9NgiiGjT2+T4IjDYAUcjAkTzCwt53Z+NkoOEEyfmm+YaXkwelURNFO/tof
         ULECvIdwcz1tkvyqbi75n/5wS88xX/n9KDys1gxQI5i8XaO5MqNQQoskD7L6wjNtFRvn
         I/jTCRwKixzkvVOED2ycHlcQciYXeGqLA7iFM9bMqO5DYykTRlmES2yKY2Ps1HXYID0m
         28Kg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1794423682; x=1795028482;
        h=content-type:in-reply-to:content-language:references:cc:to:subject
         :from:user-agent:mime-version:date:message-id:sender:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=ibbZxZ0AUA89ICzojImIUdj4mBfVP5cQ49POtiuj0Pg=;
        b=dylLt13pXYUa7LDB+RaJ9iQpMwBVjrUdF4ij49mO8qbV8cxKKAPQNBT5eHDzE2kVaY
         tG+eDo19fOFPk90qeL6P7DmNG74eG2hyD9fCebIqWa3LgSq9q+sFjbIRsutocTgr0zuT
         nbg/xto4FSBOdw4jFVCjFJ3U28+MEJPqnyHj5+4aryBtWTZ0f5Xmiw93zvskzyzR/rWd
         myP+4iQP+w0z8q8/QzP4EHdhH2788InCO2OFHWeMk87NKtSccWlR3kFI2O1HPClNijS5
         SbetrsfzJIAk4h5ojD3blC9I5BdNFAujvQvPnlW3KaF8MM0e6lWFGkUGzQ+z+kUuPTKl
         41WQ==
X-Forwarded-Encrypted: i=1; AL+hErFEUKKpNdYGN8mIq03lGvHBRueOPFxu4ZACff00snUS2PeYqEXnNDgbV7moIethAdHhxyX4@lists.linux.dev
X-Gm-Message-State: APuU4Z+ZFtZqyBZe7jTjo2KmwIgRTOW6eM5qT88aTlse7S0FAdXzPmlM
	TdKtsSuIWNDxQQViULvCTeEFq/Yllzu0R/37CP/loIbHQbcFzicgQRNodBvjvQnIZi4=
X-Gm-Gg: AYBFou3gIlkehi+DKpJ3hxJuWALk6jCRA/mT3DZmFVvY1IgeuBzKpBrkg+fD3v0fy46
	ZYDo7dhAnR88jClyv3jegSRFBBXlk9fKOUvKM1WLb+LJeRF+KoXPVXfd11XkiD8Nk24cwew0yqe
	RS+UfSta6hqkuImnMpKUJZpQQyLSivNN931R6MIiqMmexRjUZzAwa0vOxNBBO6Yc1+TRvY/gMII
	CvtthADwNbElbeCm47es35/0asVgcgNTlZmm/1nIsDdGrZEPI1kcIRgx/QcAQILlEVGIYkbYHnR
	k1XBp0QDhR67B560qxF1vHYSU8FBt1Gn4wRDShuhu246nUq60PoLiRUlwsCbYllcSsAMmMKYZYW
	SKT9F8KG+whPVoC9QvLI4TCboBe6D2tMlyH4g91C1zfddw05dBUM83cI6VK0z9GjhjRmlfIuu9W
	1d6XIC7whXfK4oR/dnrITXOLci4aPlJQKdR9aNuTagdCMhCD/2Gv02ESiIO2U+tQ72aN/EMxFJG
	1BnSXeUuyN67q2+XWDCMWpOMe+113NY72APgIsBUmoudMC9bV49F1flIimqiCKcG/WHJqH9EO9x
	Ud0N68Ipv7xUvcKvDpIzAmHaUYpFGA6klq7TN7FoVH6PeblHtosyjnl4cZbEdcesM0Co0xQPruk
	yC13g7afd466mZM8VyxnzZQ==
X-Received: by 2002:a05:6000:2301:b0:48e:5071:420 with SMTP id ffacd0b85a97d-499c38baf65mr6310015f8f.2.1794423681839;
        Wed, 11 Nov 2026 11:01:21 -0800 (PST)
Received: from [10.128.10.232] (195-23-151-163.net.novis.pt. [195.23.151.163])
        by smtp.gmail.com with ESMTPSA id ffacd0b85a97d-4988bdef64dsm11095632f8f.20.2026.11.11.11.01.20
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Wed, 11 Nov 2026 11:01:21 -0800 (PST)
Sender: Julian Braha <julian.braha@gmail.com>
Message-ID: <6d7d25fa-69ef-42b0-b7f2-bb59ebf0eb2f@gmail.com>
Date: Wed, 11 Nov 2026 19:01:19 +0000
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 4/4] scripts/Kconfig.toolchain: Document minimum supported
 versions for dynamic checks
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
Content-Language: en-US
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
Content-Type: multipart/signed; micalg=pgp-sha256;
 protocol="application/pgp-signature";
 boundary="------------OXKw02O0ZQVKPdopabmDPVkH"

This is an OpenPGP/MIME signed message (RFC 4880 and 3156)
--------------OXKw02O0ZQVKPdopabmDPVkH
Content-Type: multipart/mixed; boundary="------------AiKmJ8XeW8CJXxcJsL6rEg05";
 protected-headers="v1"; hp="clear"
Message-ID: <6d7d25fa-69ef-42b0-b7f2-bb59ebf0eb2f@gmail.com>
Date: Wed, 11 Nov 2026 19:01:19 +0000
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
From: Julian Braha <julianbraha@gmail.com>
Subject: Re: [PATCH 4/4] scripts/Kconfig.toolchain: Document minimum supported
 versions for dynamic checks
To: Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>
Cc: Nick Desaulniers <ndesaulniers@google.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Arnd Bergmann <arnd@arndb.de>, Kees Cook <kees@kernel.org>,
 linux-kernel@vger.kernel.org, linux-kbuild@vger.kernel.org,
 llvm@lists.linux.dev
References: <20261110-kconfig-toolchain-updates-v1-0-6d4fb636290e@kernel.org>
 <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>
Content-Language: en-US
In-Reply-To: <20261110-kconfig-toolchain-updates-v1-4-6d4fb636290e@kernel.org>

--------------AiKmJ8XeW8CJXxcJsL6rEg05
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: quoted-printable

On 11/11/26 05:42, Nathan Chancellor wrote:
> To make it easier to clean up unnecessary dynamic checks when the
> minimum supported version of a toolchain component is updated, add
> comments documenting when features were first supported. Request that
> future additions document this as well.

Love, love, love this!

I tested the bounds and replicated nearly all of your results, but had a
few notes:

>=20
> Signed-off-by: Nathan Chancellor <nathan@kernel.org>
> ---
>  scripts/Kconfig.toolchain | 32 ++++++++++++++++++++++++++++++++
>  1 file changed, 32 insertions(+)
>=20
> diff --git a/scripts/Kconfig.toolchain b/scripts/Kconfig.toolchain
> index 26a62b15e9ab..3a9eb8317d59 100644
> --- a/scripts/Kconfig.toolchain
> +++ b/scripts/Kconfig.toolchain
> @@ -1,4 +1,9 @@
>  # SPDX-License-Identifier: GPL-2.0-only
> +# When adding a new dynamic check (such as {cc,ld}-option{,-str} or te=
sting a
> +# small program), please add a comment documenting the first version o=
f the
> +# tool that supported the feature being tested. For cc-option{,-str}, =
note the
> +# "beware" comment below.
> +
>  config CC_VERSION_TEXT
>  	string
>  	default "$(CC_VERSION_TEXT)"
> @@ -118,6 +123,7 @@ config GCC_ASM_GOTO_OUTPUT_BROKEN
>  config CC_HAS_ASM_GOTO_OUTPUT
>  	def_bool y
>  	depends on !GCC_ASM_GOTO_OUTPUT_BROKEN
> +	# supported since clang-10 and gcc-11

'asm goto' failed for me with clang 10. Seems it was added with
clang 11 [1]

>  	depends on $(success,echo 'int foo(int x) { asm goto ("": "=3Dr"(x) :=
:: bar); return x; bar: return 0; }' | $(CC) -x c - -c -o /dev/null)
> =20
>  config CC_HAS_ASM_GOTO_TIED_OUTPUT
> @@ -129,6 +135,7 @@ config TOOLS_SUPPORT_RELR
>  	def_bool $(success,env "CC=3D$(CC)" "LD=3D$(LD)" "NM=3D$(NM)" "OBJCOP=
Y=3D$(OBJCOPY)" $(srctree)/scripts/tools-support-relr.sh)
> =20
>  config CC_HAS_ASM_INLINE
> +	# supported since clang-11 and gcc-9
>  	def_bool $(success,echo 'void foo(void) { asm inline (""); }' | $(CC)=
 -x c - -c -o /dev/null)
> =20
>  config CC_HAS_ASSUME
> @@ -161,6 +168,8 @@ config CC_HAS_ASSUME
>  #    pitfall.
> =20
>  config CC_OPT_ZERO_INIT_PADDING_BITS
> +	# supported since gcc-15. not needed for clang, as it does this by de=
fault since clang-20
> +	# https://github.com/llvm/llvm-project/
> commit/7a086e1b2dc05f54afae3591614feede727601fa
>  	def_string "$(cc-option-str,-fzero-init-padding-bits=3Dall)"
> =20
>  config CC_OPT_NO_ADDRSIG
> @@ -168,12 +177,15 @@ config CC_OPT_NO_ADDRSIG
>  	def_string "-fno-addrsig" if CC_IS_CLANG
> =20
>  config CC_OPT_DIAGNOSTICS_SHOW_CONTEXT
> +	# supported since gcc-16, not supported by clang
>  	def_string "$(cc-option-str,-fdiagnostics-show-context=3D2)"
> =20
>  config CC_OPT_DIAGNOSTICS_SHOW_INLINING_CHAIN
> +	# supported since clang-23. not needed for gcc, as it does this by de=
fault
>  	def_string "$(cc-option-str,-fdiagnostics-show-inlining-chain)"
> =20
>  config CC_OPT_STRICT_FLEX_ARRAYS
> +	# supported since clang-16 and gcc-13
>  	def_string "$(cc-option-str,-fstrict-flex-arrays=3D3)"

Clang 15 supports '-fstrict-flex-arrays' [1] so the check seemingly
passed, but support for level 3 wasn't actually added until clang 16.

I think this needs a:
    'depends on !CC_IS_CLANG || CLANG_VERSION >=3D 160000'
so the option evaluates as empty string when these deps are unmet.

> =20
>  config CC_OPT_NO_ALLOW_STORE_DATA_RACES
> @@ -181,51 +193,67 @@ config CC_OPT_NO_ALLOW_STORE_DATA_RACES
>  	def_string "$(cc-option-str,-fno-allow-store-data-races,--param=3Dall=
ow-store-data-races=3D0)" if CC_IS_GCC
> =20
>  config CC_HAS_MNOP_MCOUNT
> +	# supported since clang-10 and gcc-9 but option is architecture speci=
fic
>  	def_bool $(cc-option,-mnop-mcount)

'-mnop-mcount' worked for me on x86 with gcc 5 [3], but it seems s390
support came later in v9 [4]

> =20
>  config LD_OPT_FORCE_GROUP_ALLOCATION
> +	# supported since ld.lld 19 and GNU ld 2.29
>  	def_string "$(ld-option-str,--force-group-allocation)"
> =20
>  config LD_OPT_NO_WARN_RWX_SEGMENTS
> +	# supported since GNU ld 2.39, not supported by ld.lld
>  	def_string "$(ld-option-str,--no-warn-rwx-segments)"
> =20
>  config CC_OPT_WNO_ADDRESS_OF_PACKED_MEMBER
> +	# supported since clang-4 and gcc-9
>  	def_string "$(cc-option-str,-Wno-address-of-packed-member)"
> =20
>  config CC_OPT_WNO_FORMAT_OVERFLOW_NON_KPRINTF
> +	# supported since clang-18, not needed for gcc
>  	def_string "$(cc-option-str,-Wno-format-overflow-non-kprintf)"
> =20
>  config CC_OPT_WNO_FORMAT_TRUNCATION_NON_KPRINTF
> +	# supported since clang-18, not needed for gcc
>  	def_string "$(cc-option-str,-Wno-format-truncation-non-kprintf)"
> =20
>  config CC_OPT_WNO_DEFAULT_CONST_INIT_UNSAFE
> +	# supported since clang-21, not needed for gcc
>  	def_string "$(cc-option-str,-Wno-default-const-init-unsafe)"
> =20
>  config CC_OPT_WNO_DANGLING_POINTER
> +	# supported since gcc-12, not needed for clang
>  	def_string "$(cc-option-str,-Wno-dangling-pointer)"
> =20
>  config CC_OPT_WVLA_LARGER_THAN
> +	# supported since gcc-7, not supported by clang
>  	def_string "$(cc-option-str,-Wvla-larger-than=3D1)"
> =20
>  config CC_HAS_WSTRINGOP_OVERFLOW
> +	# supported since gcc-7, not supported by clang
>  	def_bool $(cc-option,-Wstringop-overflow)
> =20
>  config CC_OPT_WNO_UNTERMINATED_STRING_INITIALIZATION
> +	# supported since gcc-15 and clang-21
>  	def_string "$(cc-option-str,-Wno-unterminated-string-initialization)"=

> =20
>  config CC_OPT_WERROR_DESIGNATED_INIT
> +	# supported since gcc-5, not supported by clang
>  	def_string "$(cc-option-str,-Werror=3Ddesignated-init)"
> =20
>  config CC_OPT_WENUM_CONVERSION
> +	# supported since clang-3.2 and gcc-10
>  	def_string "$(cc-option-str,-Wenum-conversion)"
> =20
>  config CC_OPT_WNO_PACKED_NOT_ALIGNED
> +	# supported since gcc-8, not supported by clang
>  	def_string "$(cc-option-str,-Wno-packed-not-aligned)"
> =20
>  config CC_OPT_WNO_FORMAT_OVERFLOW
> +	# supported since gcc-7 and clang-18
>  	def_string "$(cc-option-str,-Wno-format-overflow)"
> =20
>  config CC_OPT_WNO_STRINGOP_TRUNCATION
> +	# supported since gcc-8, not supported by clang
>  	def_string "$(cc-option-str,-Wno-stringop-truncation)"
> =20
>  config CC_HAS_COUNTED_BY
> @@ -252,14 +280,18 @@ config CC_HAS_BROKEN_COUNTED_BY_REF
>  	default y if CC_IS_CLANG && CLANG_VERSION < 220100
> =20
>  config CC_HAS_ALLOC_TOKEN
> +	# supported since clang-22, not supported by gcc
>  	def_bool $(cc-option,-falloc-token-max=3D123)
> =20
>  config CC_HAS_MULTIDIMENSIONAL_NONSTRING
> +	# supported since gcc-15 and clang-21
>  	def_bool $(success,echo 'char tag[][4] __attribute__((__nonstring__))=
 =3D { };' | $(CC) $(CLANG_FLAGS) -x c - -c -o /dev/null -Werror)
> =20
>  config CC_OPT_INLINE_MEMSET
>  	string
> +	# supported since gcc-14
>  	default "-finline-stringops=3Dmemset" if $(cc-option,-finline-stringo=
ps=3Dmemset)
> +	# supported since clang-22
>  	default "-mllvm -max-store-memset=3D4294967294" if $(cc-option,-mllvm=
 -max-store-memset=3D4294967294)
> =20
>  config LD_CAN_USE_KEEP_IN_OVERLAY
>=20
> -- 2.56.0
>=20

[1]
https://releases.llvm.org/11.0.0/tools/clang/docs/LanguageExtensions.html=

[2]
https://releases.llvm.org/15.0.0/tools/clang/docs/ReleaseNotes.html#major=
-new-features
[3] https://gcc.gnu.org/gcc-5/changes.html#x86
[4] https://gcc.gnu.org/gcc-9/changes.html#s390

- Julian Braha




--------------AiKmJ8XeW8CJXxcJsL6rEg05--

--------------OXKw02O0ZQVKPdopabmDPVkH
Content-Type: application/pgp-signature; name="OpenPGP_signature.asc"
Content-Description: OpenPGP digital signature
Content-Disposition: attachment; filename="OpenPGP_signature.asc"

-----BEGIN PGP SIGNATURE-----

wnsEABYIACMWIQT6qjll++tIFxF8TUPElYPCBXNxIAUCavS7gAUDAAAAAAAKCRDElYPCBXNxIFXd
AP97y3g2Ub97AFzCrczSMb4sT2GyzxZRrL1efJ7+kCebegD/VQABtAUuVtuD5BEo+mLgOmJTvZhP
ejIUhi9yx/4VPgs=
=Q2PJ
-----END PGP SIGNATURE-----

--------------OXKw02O0ZQVKPdopabmDPVkH--
