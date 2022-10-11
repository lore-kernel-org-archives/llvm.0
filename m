Received: from mail-oi1-f175.google.com (mail-oi1-f175.google.com [209.85.167.175])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 926BF15A9
	for <llvm@lists.linux.dev>; Tue, 11 Oct 2022 03:46:15 +0000 (UTC)
Received: by mail-oi1-f175.google.com with SMTP id m81so14681176oia.1
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 20:46:15 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=linux-foundation.org; s=google;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=gOCfVbhcmfemwDry8i3hJvK3Apv3toHgXqWLJkr3nNE=;
        b=DeN1JB/nmolLys/Yy/JmDaRoMglhhZ3TbR9eVxk4aCEtsK48S6sT94nPiaVhVoqQ/h
         +tV3Ko/3KHZTBeGjKdnhRc5+/9TxKK9+Zj+Kls1rJKDU8rIzz8sh8SuvEB0GTj308DIL
         pDq8XBO1OH+50wwV459S7kDAjk3O0a08z/v54=
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=gOCfVbhcmfemwDry8i3hJvK3Apv3toHgXqWLJkr3nNE=;
        b=m4Sca7SkQrPywPTdxygCe1XfQEyuXCLNQTJeH6JQwGd3FWDtsAxyEyewW+uGTztkRs
         ZtH2sOwncGJ4NcPQAdjet/GkGrqZ3Gb2rBl06BRtl6wivPBVXUPwf+NHw4uinQKtIBOt
         uHFO5tc/Iv1XgVV7saNPErnnZ7ntHp1dZ2oYlkvB+OKObI/8Qafgz5KIs3c8ekM4j8ir
         7Gt0NVZts1vIT/MJpz4cvpUSufX+HNrzdQZQn+y+tpJGBKcdeYrIgmKpH5ljkbZzet8F
         xyjir5CQ1UKiUQawETFjrlssrOyVu/iHCGbpj5qiG+G+j2GtXSDAOBc99LVxlFF9E5Xj
         2ZBg==
X-Gm-Message-State: ACrzQf2jTt8N1Q1gKTpc3kdzfO4iKNdVLlvv2ZdoEaGsNK5nXghNL74C
	+dRPEbm9eNbFOtfV1DSkjE6MjXzyf4ECaQ==
X-Google-Smtp-Source: AMsMyM7vox0LsxdYQfmkd7xOOBr++um3OOt1A/aAVxw1W2Ak+eeP9y3GvKNvgJvaj9TsJeimfWAujw==
X-Received: by 2002:a05:6808:21a3:b0:350:d502:4f50 with SMTP id be35-20020a05680821a300b00350d5024f50mr11116175oib.175.1665459974194;
        Mon, 10 Oct 2022 20:46:14 -0700 (PDT)
Received: from mail-oi1-f177.google.com (mail-oi1-f177.google.com. [209.85.167.177])
        by smtp.gmail.com with ESMTPSA id w23-20020a4a3557000000b00480549b424asm3965094oog.34.2022.10.10.20.46.13
        for <llvm@lists.linux.dev>
        (version=TLS1_3 cipher=TLS_AES_128_GCM_SHA256 bits=128/128);
        Mon, 10 Oct 2022 20:46:13 -0700 (PDT)
Received: by mail-oi1-f177.google.com with SMTP id j188so7672255oih.4
        for <llvm@lists.linux.dev>; Mon, 10 Oct 2022 20:46:13 -0700 (PDT)
X-Received: by 2002:a05:6870:c0c9:b0:127:c4df:5b50 with SMTP id
 e9-20020a056870c0c900b00127c4df5b50mr11380013oad.126.1665459963186; Mon, 10
 Oct 2022 20:46:03 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20221011031843.960217-1-masahiroy@kernel.org>
In-Reply-To: <20221011031843.960217-1-masahiroy@kernel.org>
From: Linus Torvalds <torvalds@linux-foundation.org>
Date: Mon, 10 Oct 2022 20:45:47 -0700
X-Gmail-Original-Message-ID: <CAHk-=wjP4=XP6E30mRp3OP2swZOrML9Z78kJvKo8ejFi4WGZjw@mail.gmail.com>
Message-ID: <CAHk-=wjP4=XP6E30mRp3OP2swZOrML9Z78kJvKo8ejFi4WGZjw@mail.gmail.com>
Subject: Re: [RFC PATCH] Remove Intel compiler support
To: Masahiro Yamada <masahiroy@kernel.org>
Cc: Thomas Gleixner <tglx@linutronix.de>, Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>, 
	Dave Hansen <dave.hansen@linux.intel.com>, x86@kernel.org, 
	"H . Peter Anvin" <hpa@zytor.com>, Greg Kroah-Hartman <gregkh@linuxfoundation.org>, linux-ia64@vger.kernel.org, 
	Nick Desaulniers <ndesaulniers@google.com>, Miguel Ojeda <ojeda@kernel.org>, Len Brown <lenb@kernel.org>, 
	Nathan Chancellor <nathan@kernel.org>, Nick Terrell <terrelln@fb.com>, 
	"Rafael J. Wysocki" <rafael.j.wysocki@intel.com>, Robert Moore <robert.moore@intel.com>, 
	Tom Rix <trix@redhat.com>, devel@acpica.org, linux-acpi@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Mon, Oct 10, 2022 at 8:19 PM Masahiro Yamada <masahiroy@kernel.org> wrote:
>
> I am sending this to Linus and the x86 maintainers with RFC.
> If somebody is still using ICC, please speak up!

Ack. I don't think anybody ever really used icc.

I can't recall having heard a single peep about icc problems, and I
don't think it's because it was *so* good at emulating gcc that nobody
ever hit any issues.

               Linus
