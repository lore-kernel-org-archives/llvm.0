Received: from mail-pf1-f172.google.com (mail-pf1-f172.google.com [209.85.210.172])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 10FBB847C
	for <llvm@lists.linux.dev>; Fri,  7 Apr 2023 17:44:44 +0000 (UTC)
Received: by mail-pf1-f172.google.com with SMTP id bm13so12823782pfb.5
        for <llvm@lists.linux.dev>; Fri, 07 Apr 2023 10:44:44 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20210112; t=1680889484; x=1683481484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=eeevj2IXfQ5qKWd9tc/WTPMDjydGded23Wx96ttD0lI=;
        b=hhqIeBHDIU5yzroiAIHl+7N6gz1w2qhb+FwHxu6UgMzdA6Fn4bc96z4iNP6uq0+ucK
         SfTWCoqxapUnKo5o0sEdTX+d7PYT1t7QbKlAF/LAqmZ69ldi5F8mQJzcMRl21RC5Oz/D
         8ly4IetMDqXyRp7vPXLZhS56PnIh+7KUl7vAXgBWDoAX38K6hqjTcIdiPyFE2dggrMka
         S/XEHPVLEFx9yuyS15lLboTLxr3MwnU/hQq/eNMBsSCCNaHI1Ur+g+bxoYnLJIqgZNoE
         /2sMR6UuqXxesV7+iS3U77sldJTpU19MinXiiXy2icHcg2CYvxUGt8MvHCKUS2mXf1gu
         1gYg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112; t=1680889484; x=1683481484;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=eeevj2IXfQ5qKWd9tc/WTPMDjydGded23Wx96ttD0lI=;
        b=BjBDmopuzL6UV8+dtZLWjbwqIBneRMxGv/F2w2s62+cK6ZNbDV7XxT93bnYCfT1t0D
         bunC8UvkngF/TeaHYje6Gn9VkHq4ijvoXpADRMsJNbl3LB6zbRgwDn12CsTO2DFd5Bte
         JTIqRY3uIk7vYm9XwbQIT0NI21BTASdKlMpKAEAB34+cN8LV5xAEjaRxIDSmizcCIY7n
         QW6IVMxvj2xqpXX1xMte2Qbz/mzW8kHOda3AJzWnF0AI4/dzxYhJr8CmO9e56HlT2mKp
         5RonuuR/x+QwEG81bx4HdmtH2YX14KECIJLbjNlqZtTKP0drxVsknAZgnXq27lJiN9Ku
         Mibw==
X-Gm-Message-State: AAQBX9eYdArCcSK/+3+pmaquOBys7nzRZQ0RCYQTEI3iyZo5LbLeCcgf
	UTuyRCmbPrOqnuD9/AGXg+/PmyLq1qa4zDdTnYp+4Q==
X-Google-Smtp-Source: AKy350bdMJ3LG9Gi/HkfohQwKo0s3+e/a281cskd8iLsjDWZHESfhkK9S3fdtxt2CrSKiJZP1lRF2TsMUY8mo8Nq91I=
X-Received: by 2002:a65:578e:0:b0:513:a488:f05f with SMTP id
 b14-20020a65578e000000b00513a488f05fmr625705pgr.1.1680889484187; Fri, 07 Apr
 2023 10:44:44 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230324175942.2653272-1-trix@redhat.com>
In-Reply-To: <20230324175942.2653272-1-trix@redhat.com>
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Fri, 7 Apr 2023 10:44:33 -0700
Message-ID: <CAKwvOdkFK3f6zdkw4Xpa9WpTx6159GWF8J2rtMHoChStu9svVg@mail.gmail.com>
Subject: Re: [PATCH] fs: dlm: remove unused is_granted function
To: Tom Rix <trix@redhat.com>
Cc: ccaulfie@redhat.com, teigland@redhat.com, nathan@kernel.org, 
	cluster-devel@redhat.com, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Mar 24, 2023 at 10:59=E2=80=AFAM Tom Rix <trix@redhat.com> wrote:
>
> clang with W=3D1 reports
> fs/dlm/lock.c:239:19: error: unused function
>   'is_granted' [-Werror,-Wunused-function]
> static inline int is_granted(struct dlm_lkb *lkb)
>                   ^
> This function is not used so remove it.

How about instead of remove it, we see if we can reuse it?
Grep for DLM_LKSTS_GRANTED. The comparisons on:

2668: if (lkb->lkb_status !=3D DLM_LKSTS_GRANTED)
2787: if (lkb->lkb_status =3D=3D DLM_LKSTS_GRANTED &&
3749: if (lkb->lkb_status !=3D DLM_LKSTS_GRANTED)

all look like they ought to.


>
> Signed-off-by: Tom Rix <trix@redhat.com>
> ---
>  fs/dlm/lock.c | 5 -----
>  1 file changed, 5 deletions(-)
>
> diff --git a/fs/dlm/lock.c b/fs/dlm/lock.c
> index 1582c8b1404c..b9c124b88f15 100644
> --- a/fs/dlm/lock.c
> +++ b/fs/dlm/lock.c
> @@ -236,11 +236,6 @@ static inline int is_altmode(struct dlm_lkb *lkb)
>         return test_bit(DLM_SBF_ALTMODE_BIT, &lkb->lkb_sbflags);
>  }
>
> -static inline int is_granted(struct dlm_lkb *lkb)
> -{
> -       return (lkb->lkb_status =3D=3D DLM_LKSTS_GRANTED);
> -}
> -
>  static inline int is_remote(struct dlm_rsb *r)
>  {
>         DLM_ASSERT(r->res_nodeid >=3D 0, dlm_print_rsb(r););
> --
> 2.27.0
>


--=20
Thanks,
~Nick Desaulniers
