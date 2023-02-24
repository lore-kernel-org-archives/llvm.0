Received: from mail-yw1-f179.google.com (mail-yw1-f179.google.com [209.85.128.179])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id EE9453D8F
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 22:38:40 +0000 (UTC)
Received: by mail-yw1-f179.google.com with SMTP id 00721157ae682-536cd8f6034so18510377b3.10
        for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 14:38:40 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=IiZXfgYrspTV0X/zg/5bl8O+J9jjbguyQkrt9WII1A0=;
        b=bzK+Jq7kLQRRdxUfI3rrYPnfSI3JnEffWb9iDWXTH0zft44uEZTbkiVOJXDQdTrACx
         59XzqxmqHVQCjrcalYuHfMAMDZKQoxSe2WvnX0XCrmjwY/IdV9J+qg1BogLexreysUe/
         SokQYPWnZtnNi5IN3KBC6XGp6n88V1leOyFWNsyofCONgxYyK8yVnls6D6c15HzNTcPP
         jzTeweizmYsODUhNV63ps10xzbOpXTwQQGV+HGZen1SeStHtArDAsMd+sxc68prDIqlS
         bUM99cfGDG0fEihCtelGXCu922xUv5H42Pa6/jdLojJVOXzmFnr8QNaJ+entRlwl65be
         kCsg==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-message-state:from:to:cc:subject:date:message-id
         :reply-to;
        bh=IiZXfgYrspTV0X/zg/5bl8O+J9jjbguyQkrt9WII1A0=;
        b=LVfDQ0vhcIfEhlWuP9fIlzCmo+IQ1QZvXhRSO4RhrrdjlKBRpxmCjAxYqClQzmtho+
         ZC8EbenR6KZ/boZo0ZS2uOPIMD7FDVmgzetXmuCasnLwfDigKH4mskQQhTKTqAZepB6M
         h1lBq6Mzt2ZjFx8DF+Smg4rY0ISewJlXKDfFLT6G9a5+jDDavQGxvN+VHW84zPCQ6iJu
         HdEFJb6Gp1w6jDeFVvhUyS6XOzQXTfZ/2A9RUPfIRVhrfkHsyBsMfHguYVNnu+Gl4UXj
         pPyvFyEKuE8RLUazLskjpFghR4r9hccs78IhQusSID+1AZL25P2y/J4c3A4y+OR0YsEZ
         w3nw==
X-Gm-Message-State: AO0yUKXMDuow25BcUrShn30afD7lrxOZUomXKzNWw5OSsA/1hvVbAzMF
	aq9UBvtj01kcK4nJ4jGaUKhNo7QK57vczz4t34g=
X-Google-Smtp-Source: AK7set+BcHZfCoW3YN7rlFFqlBxmBE2vpUFQA6KfIVb53xV/67tx3iho0pA7G0cJLfST92ibrVpx3iDHTpAZS3zFhwo=
X-Received: by 2002:a81:ac5c:0:b0:533:9b80:a30e with SMTP id
 z28-20020a81ac5c000000b005339b80a30emr5513757ywj.10.1677278319933; Fri, 24
 Feb 2023 14:38:39 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <20230224133609.2877396-1-conor.dooley@microchip.com> <mhng-f429a40f-1869-4c5b-ab4f-e7eec94489e8@palmer-ri-x1c9a>
In-Reply-To: <mhng-f429a40f-1869-4c5b-ab4f-e7eec94489e8@palmer-ri-x1c9a>
From: Miguel Ojeda <miguel.ojeda.sandonis@gmail.com>
Date: Fri, 24 Feb 2023 23:38:28 +0100
Message-ID: <CANiq72nfGfqnk4QyKsf3kmjgBVPG3WFLQqd7_+jLcYh9jG+fQw@mail.gmail.com>
Subject: Re: [RFC 0/2] RISC-V: enable rust
To: Palmer Dabbelt <palmer@dabbelt.com>
Cc: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org, 
	Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, 
	wedsonaf@gmail.com, boqun.feng@gmail.com, gary@garyguo.net, 
	bjorn3_gh@protonmail.com, corbet@lwn.net, 
	Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, 
	trix@redhat.com, rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, 
	linux-kernel@vger.kernel.org, llvm@lists.linux.dev
Content-Type: text/plain; charset="UTF-8"

On Fri, Feb 24, 2023 at 10:32 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>
> I'm fine with it, but IIRC the Rust support for most targets was pulled
> out as they weren't deemed ready to go yet.  If the Rust folks are OK

So we trimmed the original series from v8 to v9 as much as possible in
order to upstream things piece by piece, get maintainers involved, and
so on; i.e. they were not trimmed because they were not ready.

Having said that, for the architectures support in particular, what we
had is indeed a prototype: each architecture we added was able to
compile, boot into QEMU, load the sample Rust modules, pass a few
tests, and so on in our CI, using a couple kernel configs. But that is
just the basic support, and it does not mean it works for other kernel
configs, all hardware, all security features, and so on.

So it depends on how you want to approach it, whether you are
interested in the basic support or not, etc. In any case, I would
recommend having an expert on the architecture take a look to
double-check things look sane, run some tests on real hardware, etc.

> turning on RISC-V support then it's fine with me, but I think it's
> really more up to them at this point.
>
> So
>
> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>
> in case folks want to take it via some Rust-related tree, but I'm also
> fine taking it via the RISC-V tree if that's easier.

Thanks Palmer! We are trying to get maintainers of the different
subsystems/archs/... involved so that they maintain the different Rust
bits we are upstreaming, so ideally it would go through the RISC-V
tree.

Cheers,
Miguel
