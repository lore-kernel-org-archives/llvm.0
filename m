Received: from mail-pj1-f46.google.com (mail-pj1-f46.google.com [209.85.216.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 965213D8F
	for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 23:18:04 +0000 (UTC)
Received: by mail-pj1-f46.google.com with SMTP id gi3-20020a17090b110300b0023762f642dcso786667pjb.4
        for <llvm@lists.linux.dev>; Fri, 24 Feb 2023 15:18:04 -0800 (PST)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20210112.gappssmtp.com; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=MX1R2gtpS7PTJMMj2XzkRK8QoMFOMXwlDnaBp/O//5Y=;
        b=c8tddRXKciU40CU2uGoIeK1kgI4zQGR73paZYrd7u3/ki3jB1M2TQ6uhzSu9wQvF3s
         kdEzKpS2EhXW7z3UEdPsrzvfqZr6laqZAFyEJgO4/kqWPvXc70YZhiLgtoPq8Hk3ls6U
         DFmnR+n6Wy7xuCLutA/EOXdBmeTXFC5dlMT/1LgpQ9MKsB5KXhZjlC43/bYknWGD9YPi
         JUkg6hzSv11lsoS/jk7xH64ddbg07hj9yYSwEHOskrh50Qfs2W7VuZAd7TXifAdpUfm6
         5NQAWoZTrQLn55+j88OtXH6bdqMjvsza/oMvvkN8V5qvBBoHgSZHMu++tkEvu1xyaNIj
         fw0A==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20210112;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=MX1R2gtpS7PTJMMj2XzkRK8QoMFOMXwlDnaBp/O//5Y=;
        b=yabkdS6ScHoZGV2Xqp+qtCiMeYWqk24B9K8I4BpNKM9LS+OwI7Gkdvlk9vbfU2j8GP
         W5HoJvM0RHMUbUT/QCaRAJ+PoiGfOwIHWUflQPz81bmwNNFy/fE0wfnppAHKgXcR0+4f
         lzng3LHELYqPMm+4mcL04hEwDFMk9OId8/9P+fziFXizI8sdVhnKuQSURzVpXuQJty0E
         7FZjPBH9m+vyuSQhWd7sstSV9zTfMt17ewQD0ROi2RROYeiBatvFBw/JM+03fTRMdiGN
         cfsvJDrZkLtc3q7MtpWum/rDP1d+YxZIhBFKzSSG/I9LgCV7KWywj1kOUpRggDpBuaQy
         GNHA==
X-Gm-Message-State: AO0yUKV4D0geCGwbA17NFAQ5UeDPLm8kqX8rBHoCvObXCmDsTUX5jb77
	ZDpPCX/KifPjZLP0pPtzZe+wVw==
X-Google-Smtp-Source: AK7set+FjlLmjlbXKl/hb0rF9jHxqpKdq7pxOc+XOmxKvvLljAbBnp9DR6wlnW/P8k+DlGKdRyPNkw==
X-Received: by 2002:a05:6a20:7f9f:b0:cc:6728:f3da with SMTP id d31-20020a056a207f9f00b000cc6728f3damr6055852pzj.19.1677280683659;
        Fri, 24 Feb 2023 15:18:03 -0800 (PST)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id r19-20020a6560d3000000b00502ea97cbc0sm33732pgv.40.2023.02.24.15.18.03
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Fri, 24 Feb 2023 15:18:03 -0800 (PST)
Date: Fri, 24 Feb 2023 15:18:03 -0800 (PST)
X-Google-Original-Date: Fri, 24 Feb 2023 15:17:19 PST (-0800)
Subject:     Re: [RFC 0/2] RISC-V: enable rust
In-Reply-To: <CANiq72nfGfqnk4QyKsf3kmjgBVPG3WFLQqd7_+jLcYh9jG+fQw@mail.gmail.com>
CC: Conor Dooley <conor.dooley@microchip.com>, linux-riscv@lists.infradead.org,
  Conor Dooley <conor@kernel.org>, ojeda@kernel.org, alex.gaynor@gmail.com, wedsonaf@gmail.com,
  boqun.feng@gmail.com, gary@garyguo.net, bjorn3_gh@protonmail.com, corbet@lwn.net,
  Paul Walmsley <paul.walmsley@sifive.com>, nathan@kernel.org, ndesaulniers@google.com, trix@redhat.com,
  rust-for-linux@vger.kernel.org, linux-doc@vger.kernel.org, linux-kernel@vger.kernel.org, llvm@lists.linux.dev
From: Palmer Dabbelt <palmer@dabbelt.com>
To: miguel.ojeda.sandonis@gmail.com
Message-ID: <mhng-b792c358-a678-4ab3-aba4-4bc38da55744@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Fri, 24 Feb 2023 14:38:28 PST (-0800), miguel.ojeda.sandonis@gmail.com wrote:
> On Fri, Feb 24, 2023 at 10:32 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>>
>> I'm fine with it, but IIRC the Rust support for most targets was pulled
>> out as they weren't deemed ready to go yet.  If the Rust folks are OK
>
> So we trimmed the original series from v8 to v9 as much as possible in
> order to upstream things piece by piece, get maintainers involved, and
> so on; i.e. they were not trimmed because they were not ready.

OK, cool, that's way less scary.

> Having said that, for the architectures support in particular, what we
> had is indeed a prototype: each architecture we added was able to
> compile, boot into QEMU, load the sample Rust modules, pass a few
> tests, and so on in our CI, using a couple kernel configs. But that is
> just the basic support, and it does not mean it works for other kernel
> configs, all hardware, all security features, and so on.
>
> So it depends on how you want to approach it, whether you are
> interested in the basic support or not, etc. In any case, I would
> recommend having an expert on the architecture take a look to
> double-check things look sane, run some tests on real hardware, etc.

We generally take stuff pretty early in RISC-V land, for example we take 
a bunch of stuff that's just in the ISA but doesn't have any hardware 
yet.  The good news is that we don't really have any of the complicated 
language-tied features in RISC-V land, so with any luck it's pretty 
straight-forward to flip on.

>> turning on RISC-V support then it's fine with me, but I think it's
>> really more up to them at this point.
>>
>> So
>>
>> Acked-by: Palmer Dabbelt <palmer@rivosinc.com>
>>
>> in case folks want to take it via some Rust-related tree, but I'm also
>> fine taking it via the RISC-V tree if that's easier.
>
> Thanks Palmer! We are trying to get maintainers of the different
> subsystems/archs/... involved so that they maintain the different Rust
> bits we are upstreaming, so ideally it would go through the RISC-V
> tree.

Works for me.

I've got a few other things in the pipeline for this merge window so 
this probably won't make it, but I'll dig in after that.  We've got a 
bunch of Rust-types floating around Rivos as well, so with any luck 
someone else will have some time to poke around.  Having a full cycle in 
linux-next is probably the right way to go for this sort of thing 
anyway, as it's likely to shake out some long-tail issues.

That'll also give us time to sort out the authorship issues, which we'd 
of course need to do before merging anything.
