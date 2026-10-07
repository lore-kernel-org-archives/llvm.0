Received: from mail-wr1-f46.google.com (mail-wr1-f46.google.com [209.85.221.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id DAD97384243
	for <llvm@lists.linux.dev>; Wed,  7 Oct 2026 21:49:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.46
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791409784; cv=pass; b=TZIUGqK3v/snybnrz9ZpWyNobmAIX8XQTFJSQZnHOEUs7A7X32RM+BXQsPH/C0VXb5n/UIjWs04bkxKoYWx6KBoKuthtV80ejocCsCjic2DasKslyRzuaTaJpMPLWS7Y4qqiKmBdPPxHS63WOl4jZGHku6jZKeF3XWN3bWJz1gY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791409784; c=relaxed/simple;
	bh=iUfeVPFcJRl2l483RVn1FexTtf702f8k8YD91745DT0=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=pF1RL4MXaidUL51nJmfXhN8AKD5thBRpitu18unAmIbz0GmcP19vGsnfAr4LjngimqO/VfIymF55PodroFZHAMppz0GqfW9AInr4PKBIeSLYCIdsugtgWaZiKuJQB4Wx8dlCVMqKBEtVFfFz0A/Q8s0t15GVa7MTOUQziUc4fKs=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=ES5kpuJN; arc=pass smtp.client-ip=209.85.221.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="ES5kpuJN"
Received: by mail-wr1-f46.google.com with SMTP id ffacd0b85a97d-487048857f6so1956758f8f.3
        for <llvm@lists.linux.dev>; Wed, 07 Oct 2026 14:49:41 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1791409780; cv=none;
        d=google.com; s=arc-20260327;
        b=kFsjeQDi5OVmsBJXvzN6iiQyQBOf/o4C2gq3Z3sjPsHtFhj6qf+3w9LCSviIk85K9D
         yC6vPHXVlT7iQajFJW4R4rkA17jM6+8GUpwtWLb7WYpGc1IFcwKY0tgadNml7XspvBP+
         EA62QfcSu7uHoriqxwBJwY0hvjjOtyyIc9kiuTw+Z9HJOLqDUKIdw+dtUxp4bWzE7bEE
         68ISwkkjrPpUZBSULYqJH4HL26af1N7RIP6xWHRSZ9fx8F2nPg/fwyB9RrKHxTodfInm
         l61tW+keEUNarB0+EZwG8hua9hdPF1H0hC6p14LVHDuBYkZsUjOGl8X1pHNQfISNX2WT
         qrsw==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20260327;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:dkim-signature;
        bh=Dz2+W8ZDe1ZO58k707wXjnIbgkdV89r041+gMmUvvKQ=;
        fh=nDBPYWvCQxFa93atcriwRRWJOcXKyvOA4V52c7H+gYw=;
        b=HIyzY/TDDHRDqrbsaj0mGzZ1dlbox9vL9+3a3ohj3CP4nwg875Hi/6gK1WwwvA/RQv
         KXLoVn9oR29BvjJkbgScg5KIBXSWnLnoUXthlCDBWzrtIzIyyb/VNOpnkvZQw3pDFaP6
         5TAM5Eonn2RR40XDCDYLpKm6cOwfs2OeIjyzd1S1WJe2NmG1u6QwmheKHgKp0MHqkmmh
         gBjumE+7B1VOoH3EWZhV0Xu1Ozk7GcN8FYghcijw5hmG2wU+QfJMWFzFtUgOFluBzUnq
         RUhRqwv/o5+30ic1cT4c2xaYTEyNf50AqbFCjW3iHt0lSqg5MoUaoukg9aegXLDkX82C
         Ar9g==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1791409780; x=1792014580; darn=lists.linux.dev;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:from:to:cc:subject
         :date:message-id:reply-to:content-type;
        bh=Dz2+W8ZDe1ZO58k707wXjnIbgkdV89r041+gMmUvvKQ=;
        b=ES5kpuJNk9MN9hzGMgU76KWFQ+hYyQPuJB4KdUntXYMrEHHsxpS4BR2i2u9Mh79rAO
         UtKzVGuaFqxb1nzCoBoxrs5n7deF6O3HKLwcW3Exb7hW4E8JwXl9vOzFeTbrZnM0upmg
         QrAryM4jkILBx9oiR32pO3cs3Va2FB6UW3NSY6G5Zij2AQXjJVZewxbdOiQG0lRCWEKM
         68szHLwk41cXnGFWph0mASKyM+MadcXTGwEuAhTsZrXXR61pjcgM3K2iKz8lGez9HXqy
         bdMhXdVhhEoEffx4iuYcxyjOm5n1S8+9W2i2+RbxbGbBRkZHE+Y2VcVHI9hiJ3BCQvQ1
         e2Ew==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20260707; t=1791409780; x=1792014580;
        h=content-transfer-encoding:content-type:cc:to:subject:message-id
         :date:from:in-reply-to:references:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to
         :content-type;
        bh=Dz2+W8ZDe1ZO58k707wXjnIbgkdV89r041+gMmUvvKQ=;
        b=wobgbaQupisUDHzWtIOJAc9tKJW4NTu0WGaW5ri0oFwHzRSLFXr/dxE3+1nTTMK2cP
         lTwnAovjtQSUEg4AuZXuhlpr5jy89rUcOn4vOAKirAdt3h8exJLcIupLbwKB53hjXz/+
         caXdTtF6SsJBYjOFa9bF870HDMRUqUonMyNK6hA6iIU7a6RRNvC8aFFqWFAQUe4nKzO5
         pdLTTYGwYKXbCXaQETGKvOor67lIJKqot5833BX+0rSgzhyxH2HyHitJYh6ICxYcJ5qf
         eZ3gDr1yS4xgmgRxWm9WJW/u4xf1M+s3Dst0nspUq24vtleWpekXuodTkKjQkMmnqRkY
         IuzA==
X-Forwarded-Encrypted: i=1; AKwUvByKo0kzRmBS0oMBd+DWfv9zBuWgqwnoPSrqDx1mk27gg4DHD2Phgdc4z8GzQJyglqfjPdWj@lists.linux.dev
X-Gm-Message-State: AFq9FYL1HNjsMNwZGjbSL3mqy8fI+eq0yCY899WQ78mracuiGvHWY2Yw
	a05HqX9IGaGL/sDrNy2Af+JhfqVHtoEHse/tgP604yv9E964QGt971sF03ZABWe4lIkAsAGgmWE
	6ManEtUG+zAiRW67lq1lpoz+fze8dDWVjX4JyBd3g
X-Gm-Gg: AYBFou2WxeJZslnP2J7rZZBiPoKrKlRaQTsKea+bIC1Yzu9DOcsbEy79CJV+oTUKBlt
	icQq1D1UkytDLJMnu2VhhW5mAehjLSZX3NUaTErq1EHDPIJjrlKk+/PQudewBjs+5GcvDyqQ4pJ
	l4k/1fcKW47w7CwYr2tFoHb7GefrQWKD5B+rOdqInBwCNC4L0pLNl/bIJy0jkT4ktNil+WQhpiD
	ybeaFDAaAYsQoK+8/uJLulo3+7tVpWz8EBQGt9r+Jd4uDlKoi9Ad7GixkNz8NDUOaXUm6tZBLKH
	fACA7G5SSlW8iMwAWZJGbycG3YETIRmkZWYBXPo/3SWZW1MlIHRiocs5CsH7PRUCWKbG3nNJ9p0
	OHgjz0urEcRiD99acF3UoMRUUPPUkSxlbKSSZwl26pmj+vgUPiS+tgIaDulvUfGuoMw+ydDleGR
	df7w==
X-Received: by 2002:a5d:64c4:0:b0:48b:f92:1f75 with SMTP id
 ffacd0b85a97d-48c7289726emr6747670f8f.48.1791409779287; Wed, 07 Oct 2026
 14:49:39 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
In-Reply-To: <20261007-b4-landlock-fix-domain-fortify-panic-v1-1-042e9108f5f8@oss.qualcomm.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Wed, 7 Oct 2026 14:49:28 -0700
X-Gm-Features: AclHuK-XtGI88zcQiAtV3bin7-xktDfZZWB8sWf-q8RSqTy-N84xG7PdKD2ogLk
Message-ID: <CAKwvOd=nPgEm=AZbEu12Eb90GtRUThY6YAjSiHHuNVHP8TZHwg@mail.gmail.com>
Subject: Re: [PATCH] landlock: Move the domain layer counter out of the
 anonymous union
To: Abel Vesa <abel.vesa@oss.qualcomm.com>, Bill Wendling <morbo@google.com>, 
	Tingmao Wang <m@maowtm.org>, Nathan Chancellor <nathan@kernel.org>, Kees Cook <kees@kernel.org>
Cc: "Gustavo A. R. Silva" <gustavoars@kernel.org>, Justin Stitt <justinstitt@google.com>, 
	linux-security-module@vger.kernel.org, linux-kernel@vger.kernel.org, 
	linux-hardening@vger.kernel.org, llvm@lists.linux.dev, 
	Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Wed, Oct 7, 2026 at 9:28=E2=80=AFAM Abel Vesa <abel.vesa@oss.qualcomm.co=
m> wrote:
>
> With Clang 20 and CONFIG_FORTIFY_SOURCE, stacking Landlock domains can
> trigger a fortify panic in the handled_masks copy in inherit_ruleset():
>
>   __fortify_panic
>   landlock_merge_ruleset
>   __arm64_sys_landlock_restrict_self
>
> Clang miscalculates the location of the __counted_by counter in the

Thanks for the patch.

Would you consider this a bug in clang, or an error in how the
__counted_by attribute is applied?

If the former, then a bug report against upstream llvm-project/ and a
link to that bug report would be appreciated.  Then Bill can take a
look.

Or if this was a known issue specific to clang 20, then we should have
a link to the fix (or consider bumping counted_by support to the
compiler version that is bug free).

> anonymous structure nested inside the domain's union.  In an arm64 build,
> __builtin_dynamic_object_size(domain->handled_masks, 1) reads offset 40
> (the first handled_masks entry) instead of offset 36 (num_layers).
> Because the destination domain is zero-initialized and its masks have not
> yet been populated, FORTIFY sees a zero-sized destination and rejects the
> copy of the parent's layers.
>
> Move num_layers and handled_masks to the top level of landlock_domain so
> that Clang uses the correct counter.
>
> Assisted-by: LLM
> Fixes: bd3a19800dd1 ("landlock: Add counted_by in landlock_domain")
> Reported-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Co-developed-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Konrad Dybcio <konrad.dybcio@oss.qualcomm.com>
> Signed-off-by: Abel Vesa <abel.vesa@oss.qualcomm.com>
> ---
> Move the domain layer counter and flexible array out of the anonymous
> union to work around Clang 20 reading the wrong counter for __counted_by.
> This fixes the FORTIFY panic when copying the parent domain's layer stack=
.
>
> Based on next-20260930. Validated arm64 Landlock object builds with
> Clang 20 and GCC 14, with CONFIG_FORTIFY_SOURCE enabled, and checked the
> counter load in Clang-generated code. Not boot-tested.
> ---
>  security/landlock/domain.h | 48 +++++++++++++++++++---------------------=
------
>  1 file changed, 20 insertions(+), 28 deletions(-)
>
> diff --git a/security/landlock/domain.h b/security/landlock/domain.h
> index caa3d19d2c43..5e65ab004f62 100644
> --- a/security/landlock/domain.h
> +++ b/security/landlock/domain.h
> @@ -216,37 +216,29 @@ struct landlock_domain {
>                 /**
>                  * @work_free: Enables to free a domain within a lockless
>                  * section.  This is only used by landlock_put_domain_def=
erred()
> -                * when @usage reaches zero.  The fields @usage, @num_lay=
ers and
> -                * @handled_masks are then unused.
> +                * when @usage reaches zero.  The field @usage is then un=
used.
>                  */
>                 struct work_struct work_free;
> -               struct {
> -                       /**
> -                        * @usage: Number of credentials referencing this
> -                        * domain.
> -                        */
> -                       refcount_t usage;
> -                       /**
> -                        * @num_layers: Number of layers that are used in=
 this
> -                        * domain.  This enables to check that all the la=
yers
> -                        * allow an access request.
> -                        */
> -                       u32 num_layers;
> -                       /**
> -                        * @handled_masks: Contains the subset of filesys=
tem and
> -                        * network actions that are restricted by a domai=
n.  A
> -                        * domain saves all layers of merged rulesets in =
a stack
> -                        * (FAM), starting from the first layer to the la=
st one.
> -                        * These layers are used when merging rulesets, f=
or user
> -                        * space backward compatibility (i.e. future-proo=
f), and
> -                        * to properly handle merged rulesets without
> -                        * overlapping access rights.  These layers are s=
et once
> -                        * and never changed for the lifetime of the doma=
in.
> -                        */
> -                       struct access_masks
> -                               handled_masks[] __counted_by(num_layers);
> -               };
> +               /**
> +                * @usage: Number of credentials referencing this domain.
> +                */
> +               refcount_t usage;
>         };
> +       /**
> +        * @num_layers: Number of layers that are used in this domain.  T=
his
> +        * enables to check that all the layers allow an access request.
> +        */
> +       u32 num_layers;
> +       /**
> +        * @handled_masks: Contains the subset of filesystem and network =
actions
> +        * that are restricted by a domain.  A domain saves all layers of=
 merged
> +        * rulesets in a stack (FAM), starting from the first layer to th=
e last
> +        * one.  These layers are used when merging rulesets, for user sp=
ace
> +        * backward compatibility (i.e. future-proof), and to properly ha=
ndle
> +        * merged rulesets without overlapping access rights.  These laye=
rs are
> +        * set once and never changed for the lifetime of the domain.
> +        */
> +       struct access_masks handled_masks[] __counted_by(num_layers);
>  };
>
>  static inline access_mask_t
>
> ---
> base-commit: 6c2cb8b8b843d216ab549b678a0d8831c43153e0
> change-id: 20261007-b4-landlock-fix-domain-fortify-panic-510367f8cfe3
>
> Best regards,
> --
> Abel Vesa <abel.vesa@oss.qualcomm.com>
>


--=20
Thanks,
~Nick Desaulniers
