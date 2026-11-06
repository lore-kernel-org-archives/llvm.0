Authentication-Results: smtp.subspace.kernel.org; arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
ARC-Seal: i=2; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=pass;
	t=1793986743;
	b=myOWedeBFNoVXNrYUfg1sAoanLM9czkkxEm2yBc70FPsEmqtcXhZehxpvPk2M+AVCvAd
	 ZQgPDslAL/V47Pz41dOa2QLYPEoAanlmeL3hk3BPL6wV3MogjABs8AdzbXkkFVgl4zlTK
	 xrzFOQaDVbDLvOYk3h2FN4Lh4/D7NrdzBrMRFdEx6Kkj2r8YmaEO4nDKpGRnwbuV4lUGL
	 AmECxrKlx4hrwmS0aU8+mdj7MOEH4OJ7AK6iSYDLy8KBpXUxQ06qh9C59AyTCct48NQDt
	 Y/5yohTiSm8WSSrxsuh14MOP/7yvHc00BsOpaLDPkUIgHwbFfJbmsESk7HHoH/HGF0Q==
ARC-Message-Signature: i=2; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1793986743;
	h=DMARC-Filter:Received:DKIM-Signature:X-Google-DKIM-Signature:
	 X-Gm-Message-State:X-Gm-Gg:X-Received:MIME-Version:References:
	 In-Reply-To:From:Date:X-Gm-Features:Message-ID:Subject:To:Cc:
	 Content-Type:Content-Transfer-Encoding;
	bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
	b=WWvoF/tay5loOc28xb7U8l0Rz5rOP0D/VSiIqZpigcanad3hkrR7sdGB+b9ZZ1YJwguw
	 OhWVbtExmGeoa46CjRyHjQ1x9P7hLeWX62KK1/bRw1DYASc9G9/wNCmsXFmaCAD9vLFkc
	 iW+IdQ5l15u9sOk96l03lhZWsMXGzFH9HR1/v2Vn8/yxTo3BIBNhZl5QxTbr1DtxtUfXf
	 YW+Z44yQ6tSeFe/Fo2hqC1aU4NVwg6CI1W5ecmlJ/uiuZliWuwmCYtF6O9NMPNRHDUHBm
	 IiqYA6a+I3AlcooFiumoaPxMlIYTMNj+zKM62L/m12nwk9ho/fShesC1v6eGXd1gSNg==
ARC-Authentication-Results: i=2; smtp.subspace.kernel.org; 
	dmarc=pass header.from=google.com;
	spf=pass smtp.mailfrom=google.com;
	dkim=pass header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HEm15uKA;
	arc=pass header.oldest-pass=0 smtp.remote-ip=209.85.208.51
Received: from mail-ed1-f51.google.com (mail-ed1-f51.google.com [209.85.208.51])
	(using TLSv1.3 with cipher TLS_AES_128_GCM_SHA256 (128/128 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1) server-digest SHA256)
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 84EFF606D81D
	for <llvm@lists.linux.dev>; Fri,  6 Nov 2026 17:39:03 +0000 (UTC)
DMARC-Filter: OpenDMARC Filter v1.4.2 smtp.subspace.kernel.org 84EFF606D81D
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key, unprotected) header.d=google.com header.i=@google.com header.a=rsa-sha256 header.s=20260707 header.b=HEm15uKA
Received: by mail-ed1-f51.google.com with SMTP id 4fb4d7f45d1cf-6b6966d9508so568a12.1
        for <llvm@lists.linux.dev>; Fri, 06 Nov 2026 09:39:03 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1793986742; cv=none;
        d=google.com; s=arc-20260327;
        b=rP8Iz7D5BalBDNCeTuNDvRrhAmQccu/8my6EDWE7Inb2wRYmgVdCqkg6WrXq1SIhFr
         Sz/tYsJ30PwCcTt4O1p6Saa8Fs6u+c7nJmPKmSmlwJB/B53lmwConKO7pTuhlTKNrFeG
         ZoTb1m13O/h+oJ8UTRPZmOozsDGdRCLhs3UPdJJIIMH8cgXojezhAdCXOrTx/BXMK3qK
         aVxI/2BKvVZMGxpWqLs81h4Jny7Sw8n4dg3bhPuRB08HtN4D8bsZHO7HjAN+Qh4VX/ZZ
         e0jIyxycaL6MhlrOGCzYjC/mg6vKpjIwjETugfTCcojhokMzx2gZBXFHTlm+KjUf3QfJ
         VG8A==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        fh=kdb+xlaTyCxmlOUI7uip5iC3rXXfP/sAjtTCt4JxtsI=;
        b=WSYcMj/phuwxaeFkz5XRIl1ExoIvix2/+aZmh2GiXxNIaT1IZ6W+Sq+MRPWVZcmRvg
         0eQGh94xhkgRfUkdAWaZxYkWoJJgcYmQPWOL13BvN/ZDm90GkQWRG1+2WaGMKzQ8IuCJ
         I73pLuNfs4ZbMeHltsNpDlN9AHQEFCBhtd3mm263+PmP8JAAfq6FBPb9CI89i5rZUbcA
         jLwXxZZhNcrNEA7fpBzpliTb/e/b514tT5LV+OBwY0hePN+qrptxDAtvHsexVmuKG68D
         pG96QKPs081X/tCZ7Y/Wnj/A/uxaFczdAotOGE79AUVpNhxkrCki2s8wcoOHS5jkdsAn
         NjXw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20260707; t=1793986742; x=1794591542; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        b=HEm15uKA61nu9T0i1sMpJEQZGlDYXkaL+YdyEyU4nWyyUCfqfP8yuY/xZ4Py7CvYml
         eBZ8BOidvAcd0n6nGioA6H/tFXJFNbWm8jUSiL1fm3dYQA8k69K+HWzAAmrs8+Y/re94
         aD0Wp/UYD+GfGFapDilrXfpKNWxZb3QT6s7vMiKpFo9R4Uj5vBnG/4fpoR83CJFtK748
         H5oWhwhXCrg9LevdA0pf8+aXexbTDh1HAngqT6yLc0KScjPZP6T5HEUoGPwmC11Znq7u
         CnbToqXEyyMCF2ACFG2ZZVco/brIr+vYRAifp9cecKDG1zIIijIaJ9VZEKLuXruED8ir
         gzQw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1793986742; x=1794591542;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GqiDj6frCHSUuvpzSZKk7ALvPsAa+wtM6puWkf2+a1Y=;
        b=dQZzstYSBROpXGmoZVqSCxJfGJHrcxksa/l/xWGVOwHaokmB0Qam2KdVycvbBx6b4B
         6oZTcDs/da5LCLfjEA1IBbtzOBdr0ahM7ltjiBJkrnZKatkJ+iLN+hLKQC9jCNYlyjJK
         lUdEP2nHGPnYIZTHyVqF2z0AefNtYq/cbHSKNNPML9ETEEICGITHMHKfKHpO6l0RRQR5
         NUNpfURWb34EuJJV+JUqzYBsnbKne/NyG5czsD2/SNPfaPfDIyEM4WsDeZ2XROUgZFmA
         JMv6uTXJTaVMUFJYRPkEVo0K8tCnMiO8/MIoRvmTaG4yTCmeyHaw5ZKVQsWJDkGf6TEJ
         OCdA==
X-Gm-Message-State: APuU4Z8+ayIVZiSq5yVIRYVafpjoCO5pJ9Cx8BcVTf8L2kbnwIGNHyGk
	XeTTzi3UfsuyMw/jkjP63LxMl/7B808pVk8sawFmcDjBr6jPjIS+eHmbfroo4HvgLVFDj937GYR
	oE6tNqjYDKDjmSVqYg9hn+ADg+M4ThUTPseaaD6/e
X-Gm-Gg: AYBFou2w64IjDDjo+6qshlN99tfNaiW08B9x34b5eVrtVVSdVBLNuS46Ww3TtX6ixn1
	PmWOEeGmqhalE/HKVYS1VOMWKd+bhURxfYUyC+2N7TtC+mPE28PCszmr0i9iXXzz+CxIPuC1kk3
	H2vOlBoB1NIJdhk875aQUcE9zBV2/7GU82SgPxIDGnvgtmKnQAD4yBJaHWzAIsmB0WnDjeKuX3l
	B1nRFSmeK0zecVU8uiALQCE8xh7AiTvu9Zc8Da9GF4AzMaAWC+Sg24+VL2WiSKgIBGSS50xV1BZ
	I0++/5knIgdlB17uonSb++r11mJPkjKE3j60nN3Hb2T1eGlubHJZVUvQixAMclXfpRN3e/mIVj5
	ZFo+8seaghuK5p/r+wgGHTc23NyG55HvnAQjYE5/uRNee8rz9wDK5/nEAw7F1Db/i5o7VSPSK8Z
	G91/KC8rAaGTqF
X-Received: by 2002:a05:6402:a594:10b0:6a6:7385:3eac with SMTP id
 4fb4d7f45d1cf-6b6f843548cmr6213a12.11.1793986741181; Fri, 06 Nov 2026
 09:39:01 -0800 (PST)
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
References: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
In-Reply-To: <20261105151159.1.I0b27923381ef34cc99cdf8b65fea2e1bafce6370@changeid>
From: Rong Xu <xur@google.com>
Date: Fri, 6 Nov 2026 09:38:48 -0800
X-Gm-Features: AclHuK9krDICcHvY12_TQOAPQOmYyqI_XtzGscWcqlFs1PTf4lzGC_gvkF1otP4
Message-ID: <CAF1bQ=QkGntJu8G67ssH2dS3Sn200_JuYitjtAfNPBu_hn0fZA@mail.gmail.com>
Subject: Re: [PATCH] kbuild: AutoFDO: Disable Profi (-fno-sample-profile-use-profi)
To: Douglas Anderson <dianders@chromium.org>
Cc: llvm@lists.linux.dev, linux-kbuild@vger.kernel.org, 
	Han Shen <shenhan@google.com>, Nathan Chancellor <nathan@kernel.org>, Nicolas Schier <nsc@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Han Wang <nesthanwang@google.com>, 
	Snehasish Kumar <snehasishk@google.com>, Nilanjana Basu <nilanjana.basu87@gmail.com>, 
	Yabin Cui <yabinc@google.com>, stable@vger.kernel.org, 
	Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>, 
	Masahiro Yamada <masahiroy@kernel.org>, linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

This looks good to me. Thanks!

Reviewed-by: Rong Xu <xur@google.com>

-Rong

On Thu, Nov 5, 2026 at 3:12=E2=80=AFPM Douglas Anderson <dianders@chromium.=
org> wrote:
>
> Starting in Clang 21 (LLVM commit 2fc4a4a9d3a8 ("[Driver][SamplePGO]
> Enable -fsample-profile-use-profi (#146795)") [1]), the Clang driver
> automatically passes -mllvm -sample-profile-use-profi whenever
> -fprofile-sample-use is specified, enabling LLVM's flow-based profile
> inference algorithm (Profi) by default.
>
> However, as Rong Xu noted [2], the kernel's AutoFDO implementation uses
> flow-sensitive discriminators (FS-AFDO), and Profi has known issues with
> FS-AFDO that degrade runtime performance compared to LLVM's original
> profile propagation algorithm. In addition, Profi's min-cost max-flow
> solver (applyFlowInference) can hit pathological compile times (30+
> minutes or hangs) on certain kernel control-flow graphs when profiles
> drift slightly or when combined with GCOV [3].
>
> Pass -fno-sample-profile-use-profi to disable Profi and restore the
> original profile propagation behavior that kernel AutoFDO was tested
> with. Guard the flag with clang-min-version 210000 since it was
> introduced in Clang 21 alongside the default change, whereas
> CONFIG_AUTOFDO_CLANG supports Clang 17+. Note that cc-option cannot be
> used to probe for the flag because cc-option invokes Clang with -Werror
> but without -fprofile-sample-use, causing Clang to fail the probe with
> -Werror,-Wunused-command-line-argument.
>
> RUSTFLAGS_AUTOFDO_CLANG and KBUILD_LDFLAGS do not need changes because
> SampleProfileUseProfi remains false by default in the LLVM backend and
> is only enabled by the Clang driver.
>
> Cc: stable@vger.kernel.org
> Fixes: 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> Suggested-by: Rong Xu <xur@google.com>
> Link: https://github.com/llvm/llvm-project/commit/2fc4a4a9d3a87a9e11c48ef=
25522aa17c2a71003 [1]
> Link: https://lore.kernel.org/r/CAF1bQ=3DS52KWHopqxksctbBirFEr5Mz1dKKMAoW=
h-dqLHii3Nig@mail.gmail.com [2]
> Link: https://github.com/ClangBuiltLinux/linux/issues/2188 [3]
> Signed-off-by: Douglas Anderson <dianders@chromium.org>
> ---
>
>  scripts/Makefile.autofdo | 1 +
>  1 file changed, 1 insertion(+)
>
> diff --git a/scripts/Makefile.autofdo b/scripts/Makefile.autofdo
> index 57a3aba6ffc2..8754b60ad2ab 100644
> --- a/scripts/Makefile.autofdo
> +++ b/scripts/Makefile.autofdo
> @@ -13,6 +13,7 @@ endif
>  ifdef CLANG_AUTOFDO_PROFILE
>    CFLAGS_AUTOFDO_CLANG +=3D -fprofile-sample-use=3D$(CLANG_AUTOFDO_PROFI=
LE) -ffunction-sections
>    CFLAGS_AUTOFDO_CLANG +=3D -fsplit-machine-functions
> +  CFLAGS_AUTOFDO_CLANG +=3D $(if $(call clang-min-version,210000),-fno-s=
ample-profile-use-profi)
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Zprofile-sample-use=3D$(CLANG_AUTOFDO_PR=
OFILE) -Zfunction-sections=3Dy
>    RUSTFLAGS_AUTOFDO_CLANG +=3D -Cllvm-args=3D-split-machine-functions
>  endif
> --
> 2.56.0.455.g6c5a503b38-goog
>
