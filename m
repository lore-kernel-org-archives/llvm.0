Received: from mail-oa1-f42.google.com (mail-oa1-f42.google.com [209.85.160.42])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3236D62A
	for <llvm@lists.linux.dev>; Fri, 11 Nov 2022 03:36:04 +0000 (UTC)
Received: by mail-oa1-f42.google.com with SMTP id 586e51a60fabf-13c569e5ff5so4282060fac.6
        for <llvm@lists.linux.dev>; Thu, 10 Nov 2022 19:36:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:from:to:cc:subject:date:message-id:reply-to;
        bh=5DLwFbcaXxTI8kikK3HOdCc4Gv3JptkdKvwplZAgy8k=;
        b=OYIyNKzRqiJ/IBm8jZEy1s86exNHopq9GLHeciOSXKsdvehkCc8rSKpiF5j26lRNzV
         wi4KrlsK09NARYT1dUkCG3vjOSa/2PLVbszy+5yt38Oa3/AqUUllaY5LECI55EC7l3Uz
         vtZEvB9GmAuQGXDjKQt52o9BIMvAGfHCaShiLzpEB9PlMuiYEniy+5zJElpjT6GeFxLQ
         fYJw0cOTdNJ+kqYaboV8hg5tXKkL7ykXTHejmprag7k5wUHPYhls2eD12EINTBzeG1Fs
         wvC8VabL9eVdqNn6cilcR+SR/58QfqBe7llnHnqJbLuyGlMKHNXRxPyuD7Tyli3M2vpV
         8HAw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5DLwFbcaXxTI8kikK3HOdCc4Gv3JptkdKvwplZAgy8k=;
        b=uGKo+jvHYwxRoPJvJvL4H6Q5ucGcdWkdFSFTMvZmmIlcv4lm3Zbn8dU45/ukGMRZX/
         28PNMx5YTdAtWl1+4toYXY7N9n4qYTAiv4ObShjZyx85GuaJIy05gFCY1IfJmGKUhvj+
         GpS2iO8lBipKwbD1xoucVkKuvmvv6TAnI1fSMgJ7Dd5QvpXHQ5aQgj5kxYhe6V+r1J/F
         akCLV6vMTPGbWt0Oyp+h1epydEMvYxjU6/PCcxrVwwW9TAXtGKJi+xVNH94a/cjetHav
         qFe/1EZ4tjTfygpodZRV+erUGrdi+IaFIKp51xWzVr4/72Q20nnkmDuExfPhwN5tVAI9
         cV/w==
X-Gm-Message-State: ACrzQf1hHKYWQ8MAHFOeelvUrOwHxBMagEGqXIpGCE8uCT0lS1bXiuOR
	5h6LwlCQpg+9OGJfH2elLck=
X-Google-Smtp-Source: AMsMyM6xUVKjYV9avOHlFJglZ7Y6zjTj1Snpe5pE9oJ3XB087NLGOAAOX7OfDjtllBmrcuuYjpQakQ==
X-Received: by 2002:a05:6870:2a43:b0:13b:c2c7:8c54 with SMTP id jd3-20020a0568702a4300b0013bc2c78c54mr2732710oab.242.1668137763127;
        Thu, 10 Nov 2022 19:36:03 -0800 (PST)
Received: from localhost ([12.97.180.36])
        by smtp.gmail.com with ESMTPSA id h24-20020a9d6f98000000b00661b46cc26bsm578495otq.9.2022.11.10.19.36.02
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Thu, 10 Nov 2022 19:36:02 -0800 (PST)
Date: Thu, 10 Nov 2022 19:36:01 -0800
From: Yury Norov <yury.norov@gmail.com>
To: Vincent MAILHOL <mailhol.vincent@wanadoo.fr>
Cc: Nick Desaulniers <ndesaulniers@google.com>, x86@kernel.org,
	Ingo Molnar <mingo@redhat.com>, Borislav Petkov <bp@alien8.de>,
	Thomas Gleixner <tglx@linutronix.de>, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Borislav Petkov <bp@suse.de>
Subject: Re: [PATCH v1 2/2] x86/asm/bitops: Use __builtin_clz*() to evaluate
 constant expressions
Message-ID: <Y23DIRG60iaei7Ft@yury-laptop>
References: <20221106095106.849154-1-mailhol.vincent@wanadoo.fr>
 <20221106095106.849154-3-mailhol.vincent@wanadoo.fr>
 <CAKwvOdmN2==9tG0fxRO8K-eAJudeemaKUuhJEAuGHc=P8GpGwA@mail.gmail.com>
 <CAMZ6RqKRP3cp=FhpA6DkKNKjgRV2ak18k=Ad-mnBPkT++gARCA@mail.gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <CAMZ6RqKRP3cp=FhpA6DkKNKjgRV2ak18k=Ad-mnBPkT++gARCA@mail.gmail.com>

On Fri, Nov 11, 2022 at 10:57:17AM +0900, Vincent MAILHOL wrote:
> On Fri. 11 Nov. 2022 at 04:01, Nick Desaulniers <ndesaulniers@google.com> wrote:
> > On Sun, Nov 6, 2022 at 1:51 AM Vincent Mailhol
> > <mailhol.vincent@wanadoo.fr> wrote:
> > >
> > >  #ifdef CONFIG_X86_64
> > > -static __always_inline int fls64(__u64 x)
> > > +static __always_inline int constant_fls64(u64 x)
> > > +{
> > > +       BUILD_BUG_ON(sizeof(unsigned long long) != sizeof(x));
> >
> > Thanks for the patches! They LGTM; but why do we need this BUILD_BUG_ON here?
> 
> There is no absolute need for sure.
> 
> Call this a paranoiac check and you will be correct. My reasoning for still
> using it is that:
> 
>   1/ It is a compile time check, so no runtime penalty.
>   2/ Strictly speaking, the C standard doesn't guarantee 'u64' and
>      'unsigned long long int' to be the same (and you can argue that in clang
>      and gcc long long is always 64 bits on all platforms and one more time
>      you will be correct).
>   3/ It serves as a documentation to say: "hey I am using the clz long long
>      version on a u64 and I know what I am doing."
> 
> If you want me to remove it, OK for me. Let me know.

In fact, compiler's typecheck would be more strict than your BUG().
For example, your check allows pointers, but compiler will complain.
