Received: from mail-yb1-f170.google.com (mail-yb1-f170.google.com [209.85.219.170])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 76AB941840
	for <llvm@lists.linux.dev>; Fri,  8 Dec 2023 22:58:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="AOk9tOFa"
Received: by mail-yb1-f170.google.com with SMTP id 3f1490d57ef6-d9b9adaf291so2606386276.1
        for <llvm@lists.linux.dev>; Fri, 08 Dec 2023 14:58:14 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1702076293; x=1702681093; darn=lists.linux.dev;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:from:to:cc:subject:date
         :message-id:reply-to;
        bh=8vkZJWyCONDAHz0FaVDvZB6zmKrAESqJ9IE9pDa4fis=;
        b=AOk9tOFalsCTKod7VIAzsaibenemfrB41cIH6GzNUQ8pwSuk9VECXo9bB5Nu/gtWAR
         77C+1A1AC3nyhsILThwLDIcfRQbiCVLfnHNSNgdQ9lv8Sy+xHp8dtBx4YhUEsGUoDPsp
         d6D9G7CXdDXMM/Fz8vcfxz2idCX+3eCEE/Y+dq3fFQNHG5YibTkHyruPp53eBcCxY6np
         y6FNu7sMUWKTPbqF7euZRdB2ZLt32nf66jOT+n6q+XmpFAX6jmscVxYSlhDWpSbRTMdg
         e+lLYOdAd41bkETwOfi3UKV6/+V7tKkugGNyqaK620nbUVfITf4n4mBUaPkSyGTpt9ib
         H1+Q==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1702076293; x=1702681093;
        h=content-transfer-encoding:cc:to:subject:message-id:date:from
         :in-reply-to:references:mime-version:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=8vkZJWyCONDAHz0FaVDvZB6zmKrAESqJ9IE9pDa4fis=;
        b=j1nxbzihpu7lFCY9CWOudXWLYFkME023QZAqumqexivFRBE46apoWzyOM3Zi6+SfHD
         2f+X1yRX5xdBPV/+gPem3zNPjmNDUc3o1SR2aMkCnH/VohUG5P5xKFb+SeKgTbSPeRvo
         8OXydlEAYRoymlEa2CtBN+ANx3hGS2tQ6qnOM5BQBD3g1J5n6YrgrLaDaGBiaOHh3N2W
         Vn6qb/EcULsjZC/sdguVsHKE/1ZG2XV/b7T++1Jum2VKwXZ2J0x5mSCCqXmMPi3CpXVl
         ro0q/XKR56UCcXGWiQ2M03GwpXtsHkFIOSlpQkC2779yJtNITpZhjIVP2soJrJO8f5JN
         IKTg==
X-Gm-Message-State: AOJu0YxF3V3TjKbvmHuOW3+0GiMhbnZyFQbVk6XIxThXJEBLEMMqAaWO
	9pIG4aUX3T9HQ3jxYl4MTBZEJwJEokCMlB4zFXc=
X-Google-Smtp-Source: AGHT+IHRjn7Lp5sdB7NwuF75Sg/gHbOAxY9dG8W4KlGbjzvaQdcV0/6nyKSUuPNwpydoRSS5n2lAP/D1SdV+eaxYSZI=
X-Received: by 2002:a25:6b4c:0:b0:db4:72de:ba0a with SMTP id
 o12-20020a256b4c000000b00db472deba0amr615111ybm.36.1702076293359; Fri, 08 Dec
 2023 14:58:13 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20231208-clang-format-mt-for-each-v1-1-b4b73186b886@quicinc.com>
In-Reply-To: <20231208-clang-format-mt-for-each-v1-1-b4b73186b886@quicinc.com>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 8 Dec 2023 23:58:02 +0100
Message-ID: <CANiq72n_9woLVKCTnhXAQcUkpS59O2QW_HzTLmpHXnkoGPiCQQ@mail.gmail.com>
Subject: Re: [PATCH] clang-format: Add maple tree's for_each macros
To: Elliot Berman <quic_eberman@quicinc.com>
Cc: Miguel Ojeda <ojeda@kernel.org>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling <morbo@google.com>, 
	Justin Stitt <justinstitt@google.com>, linux-arm-msm@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"
Content-Transfer-Encoding: quoted-printable

On Fri, Dec 8, 2023 at 11:08=E2=80=AFPM Elliot Berman <quic_eberman@quicinc=
.com> wrote:
>
> Add maple tree's for_each macros so clang-format operates correctly on
> {mt,mas}_for_each.

Thanks, applied (moved `mt_for_each` to the right spot).

I have also applied a full update of the list on top, since it has
been a while since we have done so.

Cheers,
Miguel
