Received: from mail-yw1-f177.google.com (mail-yw1-f177.google.com [209.85.128.177])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E57F0BA40
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 22:20:46 +0000 (UTC)
Received: by mail-yw1-f177.google.com with SMTP id 00721157ae682-53916ab0c6bso18143667b3.7
        for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 14:20:46 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IqQPJNfK638HDk4ODq+fMB7JJcK2vXRJP7v56xO3S9k=;
        b=HAJsEdyAG1cOY/j+Vs6v1Ro4klVsPX0l7htKPdL5rdyUoEkEXwc3EqGqF/31BqyoeR
         8Gc70jiB86abn5T/EFSlzm0tBLZDe6nthy/OgbziasK9ExC9MssJnkYayGu/7y7MiZ6x
         vLpLAmkBnQLWWxaG4HdTQW/iO+UoJzutbQCl7iyYup9ojoeDv3oB+BPX6w3NMnFlrvmF
         B7v7bhSOYv9K5Go8X+0CQR3SM7rheJYcgwBzKyef9i+y0/2WLsP/SiEOJe2jpYGOKM8V
         GGno0ZpW+yaMgPcdZajCU49icbCJhJim4ne8u8L16Ek/F5u7Tu8uMzMcwSCfFLS1wYqb
         87tQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IqQPJNfK638HDk4ODq+fMB7JJcK2vXRJP7v56xO3S9k=;
        b=2tPEp3scfMkT+O5XXjc3oSQXW0HyBA+TBXNQxe46CJqEcpNyUHLIrNwcB8nxi5kNN4
         JrdBkTjeTgFnQAxWpbhErC0Nkhxkq/DqZ0vfKyEV5V3Y86g05O+/pb9W+MavFGWYz3Xq
         AGuGaSne8FI0KaqDadnG49xRPAFGl7Bch6KYna0hUFc79vKmcK0l1fxnUbKsrGOz6tdx
         QZoHoRoup2D4LreOLr5qQF/yofuRw7riL8RiIWR+hmV7wvCM6fEm5AvWdBdhqNW7lRB2
         7PC9eHDJuRyWdiLLpKnvAdQ0UQ15MtsB1CYGM9juiM9TCT/JnMeqNOiqT0eu1AmxC7Ko
         1P4g==
X-Gm-Message-State: AO0yUKVHsKx6ruE9KMqtRdECIIwTIlZq+M2LvZtRLoudB6zKTPDCczJ7
	ZVOvKFRQs7m006gYKbsDDWa9pVFq8PsMX2a0mZo=
X-Google-Smtp-Source: AK7set+BCO4mvxBMIls68YhyM4z+vOB5zPgpVOZ6T1wB6+em698PSXYG6gf/JzasjxCkItBDvJ2GBFZIoNFQhY4OKBw=
X-Received: by 2002:a5b:ac8:0:b0:a06:538f:24b2 with SMTP id
 a8-20020a5b0ac8000000b00a06538f24b2mr3802600ybr.2.1677277245871; Fri, 24 Feb
 2023 14:20:45 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com>
 <CANiq72=4ZhV=u2ZUr=x-iAS_iMnV8GSiq0tEn7Tj0NanO=D+xQ@mail.gmail.com> <Y/kldmYcl7+2FBRB@spud>
In-Reply-To: <Y/kldmYcl7+2FBRB@spud>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 23:20:34 +0100
Message-ID: <CANiq72=btcBOmrz0=ib=2eZiiV1z4_3qm1cqyw1=jUFDiJ77bg@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Conor Dooley <conor@kernel.org>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>, 
	Wedson Almeida Filho <wedsonaf@gmail.com>, Boqun Feng <boqun.feng@gmail.com>, Gary Guo <gary@garyguo.net>, 
	=?UTF-8?Q?Bj=C3=B6rn_Roy_Baron?= <bjorn3_gh@protonmail.com>, 
	Jonathan Corbet <corbet@lwn.net>, Paul Walmsley <paul.walmsley@sifive.com>, 
	Palmer Dabbelt <palmer@dabbelt.com>, Nathan Chancellor <nathan@kernel.org>, 
	Nick Desaulniers <ndesaulniers@google.com>, Tom Rix <trix@redhat.com>, 
	rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 10:00 PM Conor Dooley <conor@kernel.org> wrote:
>
> The stuff that I have lifted here all had you as the sole author in the
> "rust" branch downstream, which is why I gave you authorship. Namely:
> afba78eacb9b ("rust: generate target specification files on the fly")
> 732b3c386328 ("rust: target: remove `cpu`")
>
> I don't see anything from [1] in these commits, so I don't think that I
> made a mistake here.

It is true that I converted the original target spec files into the
script, so I added the final lines. However, in that first commit some
of the deleted files (related to RISC-V) were created by Gary. Thus it
still feels a bit wrong to not credit Gary or even mention him.

For instance, consider an even more extreme case: somebody moving a
file or doing formatting/whitespace changes. Would they be the main
and only author?

> It's RFC for a reason, I've had a poor track record with off-list emails
> to people that do not know me so would rather do it this way :)
> Probably should have noted that I wrote the ~placeholder commit messages
> though, apologies. I'll sort that out for a potential v1.

No problem!

> That's what I did! Unless I missed something that was non-obvious, the
> only name on the commits I lifted was you. Is there somewhere else I
> should have looked for that information?

I would have traced the commits back a bit more. For instance, in the
first commit you mention above, one may see the RISC-V target files
were removed, so that means something was already there. Checking who
added those files leads to a few commits from Gary (and one from
Daniel). And then it is about making a judgement call trying to be
fair :)

Cheers,
Miguel
