Received: from mail-qk2-f12.google.com (mail-qk2-f12.google.com [74.125.230.204])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1C3A3584952
	for <llvm@lists.linux.dev>; Tue,  8 Sep 2026 17:57:26 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.230.204
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1788890248; cv=pass; b=J8uRJ+3qWmx3VTdNnmTJDHZRC45ALSio+NbbtUnC/MbrryDMCE4El61k0evIjYFKZdaS2T24dUeOh1zl2OGt70dASnmQ6gyfTIOg2YaB/kc3+p+DnV7f7LtexbGJmsMTjKN43C4cGeqiqmBq20Xq8YNx3khIML+hpdh7+YOzox4=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1788890248; c=relaxed/simple;
	bh=IJsyfPGLpm8UMa/BqkR66GRSRbIqbVXIutmTDpcavo8=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=ma2Twuu9vjRXdd9HuwnL5fz+7ETU+hkwZ34bmqs8Y2FTTEeoR7w8UkiriVS7pHy/uW4qr+8PWbm5kagaJSKIXW9HLrajf230Dm2IPDFofZqFhyL2n2gFvtd8wwU58W6GmBpF7UhQ7U1P59C9PH1i2PNbck9jOtI/FbmVXv7nIsA=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=BaI4Bd41; arc=pass smtp.client-ip=74.125.230.204
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="BaI4Bd41"
Received: by mail-qk2-f12.google.com with SMTP id d75a77b69052e-53012819c04so638201cf.0
        for <llvm@lists.linux.dev>; Tue, 08 Sep 2026 10:57:26 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1788890245; cv=none;
        d=google.com; s=arc-20260327;
        b=fZ6xodYvcVGoxg3KRqxwLzv5pYWmzGc9gLSJCOmIYodufOBj7lT2jpiviHtb7XMGRe
         zU6qGdKIVtoKW5WfVjNXGU6XpIhAbOCDdji++6g30viDuwaqojLy3tb8H6vorP+wjeAm
         ECNOVWyxp4B01jbm1+2RPH2iR0cGW5QkA///XRvv99jQg2mEarNuoBtZtKm7umiXw0Cq
         7dBNttzHAS24ibpTqcvj34xCb4daWhRHr/e0Kx7OodDuo4jHBDfA+0xCC3RwI07pmYdU
         ABekbjepiHdalw7f7FIWi3u7s5iOSNdLgrXjzt3LCdy7ahzJuJuqjfpkfzQk7LcSbVAu
         ivWg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=GB2pUu7GQQ4fx2+eTrSMAv2WzH1ekSifjwCfsPepe6g=;
        fh=JDp5meU+ZIqTLu9toEevHJWQIveANuACb54lyWhbnMo=;
        b=R5mnUolBZ+F5RBiMiHO6/P+Kd5Kqp0hy5D4n3E4MmqidZ8kUUDfICqc2NPzuG0f0jq
         y+VFFFXTFg/u0Y2/uSnwzNS4i7cdAex/pjfykY4pAbyBcIxtWljeuXfdjFT/D2pLz7ux
         5a0Qkrf1sukb7Fx/tlYTXWJ16TFHxf+lLidbE2kT/AGnzE8i5zC/V/Lax7wnBAY2eX0r
         T4tyKi/phzH2cigRJqKwXkrjM2v63howpZf4tJbsQ6uVSUdgzpvgAh+6+XfPbU5050Iq
         gNoSsP+nc8iXtTpchWc/iSxipZi0feti9/Xixlp/03Ap0ZfZSjaYq0XskG4mw8VOOmHy
         hDNw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1788890245; x=1789495045; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=GB2pUu7GQQ4fx2+eTrSMAv2WzH1ekSifjwCfsPepe6g=;
        b=BaI4Bd41aG7lZ3dwGLccSkksTMotp0UykKgp6FVKA4OucTpcBllnqvu0zZzQQTeWnn
         93Ku8kko0NlHzf8chGRLZp3bKOsNFcAcmnNgLfoEp6su+EAMBR0XV6Y2rGpNs/zHdB6Z
         Vrvv8pzNjZi1ka39qEdbHxO3sJIrxsVBIFKDdAx+7jXsqUlC598/CiCeVRFx4y4WAH9C
         8dQ4lVhUw0T6MZhI/hWP5H9opyzFcHireOuwljDLoMldL+XB6CbFchrQR+eH5x7meKW0
         IRQ1wEEUmrGo23XebLyq4qTYO+RC7YMxVxHVQcu2HBUAxlcvAjW5PI8oBI4GV4Wlr4ZJ
         Lq/w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1788890245; x=1789495045;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=GB2pUu7GQQ4fx2+eTrSMAv2WzH1ekSifjwCfsPepe6g=;
        b=WJkU2/gxjgRYTSO+tS3PLa0a3q3bmiBSjpq5eWR9eEsaqGU8OLAcoeBdcLTPU/33bc
         CORnlM1wQ/M/D9WJxBoY5+yC/KC/Nnug1W45PXS9otdcEEqkiflktk57uFo0vYVUIems
         Avav7QwCdlSS+DzLfgpv7D3zp5U+moE3YZFM0SUPbi/SVlkYPnX6uijBX71TbJJ1Klyo
         hUpI9JqUrfy0bFneUiLiCAyjby6Ggpyg+ZamoorXs7enqzToJYGyBg2n1wTRbZ5PfzY6
         +LiD6D9XlNm/JOz9FFiP0qlx9NU1mYduI6i/+MmJfaxaozwitzSHeNhaJkOfhKqCNqAa
         CzSg==
X-Forwarded-Encrypted: i=1; AKwUvBxmf7bslHa4TuFG7RQdL7QHIYwCdhn+Ber+dxQgDuKI5EBteKqL80BFAF/CZ/GgPsbK0Bnb@lists.linux.dev
X-Gm-Message-State: AFuF++nVuUlNNtCoTEFOfvh6CQDEbPwjfEGR+NLsKCZPcNroBqq4x0fa
	IpA54PHumx3dJ89MFWPOrsf8Kq17BK61pVVynVqk+uOaibKXw71NAtLyMUk+dDjWdd7+fGb2k5R
	PnuzyeqwRjYNGTVkjPx3d78zFf8sAHzq9Kyd3khuh
X-Gm-Gg: AYBFou3GAu2zzzVC8/S8VdSEMfo5k8qikBY4ZaMjhHnbOw5dNRA7jm3jY+caRHBKXN7
	V9oeYySMYvurAZhz+5sMmC+wGLuqGdDiZNQLx1D3/2LKrtsPONgJsq8taDktjh8G6zqO7YMLXnz
	I6T5dVtnKIwV7OgQCiDHYn7FYBBxQbyKvkXu0poDxuOfVPBeZcFwhx7/hoXN//el2PldqjY9T5Y
	yuy02dZPA7kM6UmWLlpDW2FXm7Cpqj1ZRKt7nXKRb+dAEJRsgx00KiqFEvdvYwZJrpXTZPswefF
	ISOr1HuwOii7e7xG4L+TzLANUfNnGlcFaCYVDVuYwam12a/LtQsxjvo9rbibSaO7K0c8KRHKdw=
	=
X-Received: by 2002:ac8:5d48:0:b0:530:4cc8:b0b8 with SMTP id
 d75a77b69052e-530a46fdc0dmr598661cf.0.1788890243316; Tue, 08 Sep 2026
 10:57:23 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <cover.1788872630.git.wutengda@huaweicloud.com> <07d3cce3cb8561c07d7c77deac81eb9ab0540ccb.1788872630.git.wutengda@huaweicloud.com>
In-Reply-To: <07d3cce3cb8561c07d7c77deac81eb9ab0540ccb.1788872630.git.wutengda@huaweicloud.com>
From: Ian Rogers <irogers@google.com>
Date: Tue, 8 Sep 2026 10:57:11 -0700
X-Gm-Features: AcwNN1VTgg87NRXDwKCaLCVHhILMhGw-jUsmsmeNaMp7Cz6AWjeluRRn2LoZeEU
Message-ID: <CAP-5=fWj19r_NcMS8DPeD7SQ7-Ak9_rRn=EOaBLUmxvPyHTSPg@mail.gmail.com>
Subject: Re: [PATCH v5 05/26] perf annotate: Normalize arch__dwarf_regnum()
 error return values
To: Tengda Wu <wutengda@huaweicloud.com>
Cc: Namhyung Kim <namhyung@kernel.org>, james.clark@linaro.org, xueshuai@linux.alibaba.com, 
	Adrian Hunter <adrian.hunter@intel.com>, Peter Zijlstra <peterz@infradead.org>, leo.yan@linux.dev, 
	Li Huafei <lihuafei1@huawei.com>, Kim Phillips <kim.phillips@arm.com>, 
	Mark Rutland <mark.rutland@arm.com>, Arnaldo Carvalho de Melo <acme@kernel.org>, Ingo Molnar <mingo@redhat.com>, 
	Bill Wendling <morbo@google.com>, Nick Desaulniers <nick.desaulniers+lkml@gmail.com>, 
	Alexander Shishkin <alexander.shishkin@linux.intel.com>, Zecheng Li <zli94@ncsu.edu>, 
	linux-perf-users@vger.kernel.org, linux-kernel@vger.kernel.org, 
	llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Tue, Sep 8, 2026 at 6:05=E2=80=AFAM Tengda Wu <wutengda@huaweicloud.com>=
 wrote:
>
> arch__dwarf_regnum() returns inconsistent error values: early path
> returns -1 while the main lookup returns -ENOENT/-EINVAL from
> get_dwarf_regnum(). Callers only check for -1, so genuine failures
> can slip through.
>
> Normalize all failures to -1 to match the callers' expectation.

This sounds like a bug in the callers but this function is local to
annotate.c and is just a convenience so:

Reviewed-by: Ian Rogers <irogers@google.com>

Thanks,
Ian

> Suggested-by: Shuai Xue <xueshuai@linux.alibaba.com>
> Signed-off-by: Tengda Wu <wutengda@huaweicloud.com>
> ---
>  tools/perf/util/annotate.c | 2 +-
>  1 file changed, 1 insertion(+), 1 deletion(-)
>
> diff --git a/tools/perf/util/annotate.c b/tools/perf/util/annotate.c
> index df70e95a8470..f3d17d153b67 100644
> --- a/tools/perf/util/annotate.c
> +++ b/tools/perf/util/annotate.c
> @@ -2492,7 +2492,7 @@ static int arch__dwarf_regnum(const struct arch *ar=
ch, const char *str)
>
>         reg =3D get_dwarf_regnum(regname, arch->id.e_machine, arch->id.e_=
flags);
>         free(regname);
> -       return reg;
> +       return reg < 0 ? -1 : reg;
>  }
>
>  /*
> --
> 2.34.1
>
