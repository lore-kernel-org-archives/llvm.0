Received: from mail-pg1-f178.google.com (mail-pg1-f178.google.com [209.85.215.178])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 5D50315495
	for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 20:41:29 +0000 (UTC)
Received: by mail-pg1-f178.google.com with SMTP id 41be03b00d2f7-54fdf8c79a3so2656294a12.3
        for <llvm@lists.linux.dev>; Tue, 20 Jun 2023 13:41:29 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=dabbelt-com.20221208.gappssmtp.com; s=20221208; t=1687293688; x=1689885688;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:from:to:cc:subject:date:message-id
         :reply-to;
        bh=5z9pNcxTbLEfuGKBKG4TC9lAt5ChqheSmY8pbRkKfL4=;
        b=kTkoFl/hOE6DUn0o/TxNy8ei8a0pwF3wJ8WdqIIbNXUDBDjEdeDGAmfD2+RKWGXJTd
         T3K28E5f3GbYQN1zmSPmZIin3KKlSUuGyR86CjJT1U2jBF/N3FKoBM9bMwkagOXfEehr
         LE1fzTMO5bKWhTaPLlsyizdUF9TGPy6aFiOY/vnQgdbBWCVEGtA3s/FI33EEAwItrMJh
         VjtW979fJDNufkx776qo5gq8zTqT3t96sPZU5T73gmbYeidCAK2U6H9M5XTJ3SV4eQVW
         XmwzVsS4j/HUUONtDF+aGJdqhuO6ywBlWfNmAig3j5c9MqBK1xx+AEcWUY6eaTj23qt/
         6u3w==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20221208; t=1687293688; x=1689885688;
        h=content-transfer-encoding:mime-version:message-id:to:from:cc
         :in-reply-to:subject:date:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=5z9pNcxTbLEfuGKBKG4TC9lAt5ChqheSmY8pbRkKfL4=;
        b=LDwHVhzRJ2EhRvEneBzPxCu4J6UJOioPFh5ShlpXLlr+HU/6r0CJWAwbiXYD0rs5Y5
         AcpZ0gxyftHnqHyg0vlNKqbEV/vitxdATSsVXlkUJjyKNvRAUZwAtilHKgFi9yI/Gl9c
         sZ6tMeBDk4AH5ugMBdx2fkfOo7f3Z7dGetXIKlQ5qTqHVsi62SwdWNFVL2h2dG1Uohrk
         bLcWk3n6pxbqEobbMSm3t7szFA5wfChBOBnuLa6Vqj/hEO0S3zCshBQTyQz91HDhX3OU
         ndHm7CIS4mq65Y5tUKiRC/P0DNecn/BAZOIw2VjzzLP2+t2yNcqipMk6piCe0rAPGSDn
         8ydw==
X-Gm-Message-State: AC+VfDzU8GdAT5ysKfQpRmA96Gy+GS+lYhjqv/8emiLd0F/cvevzopbp
	b/xPFSZqsMoImxEjVFtTRnzLTw==
X-Google-Smtp-Source: ACHHUZ4aN+60FiuHJ8u8JkwcNH+wuIJ6cgDETNgmrC7TB9kOIDKZRE8DYgI1KARaEW/l8jTpFSXGNw==
X-Received: by 2002:a05:6a20:432a:b0:115:5910:c82d with SMTP id h42-20020a056a20432a00b001155910c82dmr4124776pzk.43.1687293688585;
        Tue, 20 Jun 2023 13:41:28 -0700 (PDT)
Received: from localhost ([50.221.140.188])
        by smtp.gmail.com with ESMTPSA id 5-20020aa79145000000b006689ecd0ff4sm1442001pfi.208.2023.06.20.13.41.27
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 20 Jun 2023 13:41:27 -0700 (PDT)
Date: Tue, 20 Jun 2023 13:41:27 -0700 (PDT)
X-Google-Original-Date: Tue, 20 Jun 2023 13:40:46 PDT (-0700)
Subject:     Re: [PATCH v2 0/4] riscv: enable HAVE_LD_DEAD_CODE_DATA_ELIMINATION
In-Reply-To: <CAKwvOdn_U+yjFBn6pq5XwP1rTEKA1MWBkd0f2N8wB_nuS1_sWw@mail.gmail.com>
CC: Conor Dooley <conor@kernel.org>, jszhang@kernel.org, llvm@lists.linux.dev,
  Paul Walmsley <paul.walmsley@sifive.com>, aou@eecs.berkeley.edu, Arnd Bergmann <arnd@arndb.de>,
  linux-riscv@lists.infradead.org, linux-kernel@vger.kernel.org, linux-arch@vger.kernel.org, maskray@google.com,
  Ard Biesheuvel <ardb@kernel.org>
From: Palmer Dabbelt <palmer@dabbelt.com>
To: ndesaulniers@google.com
Message-ID: <mhng-16f1b957-5cf5-4786-a760-e4ab1fbe83ce@palmer-ri-x1c9a>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
Mime-Version: 1.0 (MHng)
Content-Type: text/plain; charset=utf-8; format=flowed
Content-Transfer-Encoding: 8bit

On Tue, 20 Jun 2023 13:32:32 PDT (-0700), ndesaulniers@google.com wrote:
> On Tue, Jun 20, 2023 at 4:13 PM Conor Dooley <conor@kernel.org> wrote:
>>
>> On Tue, Jun 20, 2023 at 04:05:55PM -0400, Nick Desaulniers wrote:
>> > On Mon, Jun 19, 2023 at 6:06 PM Palmer Dabbelt <palmer@dabbelt.com> wrote:
>> > > On Thu, 15 Jun 2023 06:54:33 PDT (-0700), Palmer Dabbelt wrote:
>> > > > On Wed, 14 Jun 2023 09:25:49 PDT (-0700), jszhang@kernel.org wrote:
>> > > >> On Wed, Jun 14, 2023 at 07:49:17AM -0700, Palmer Dabbelt wrote:
>> > > >>> On Tue, 23 May 2023 09:54:58 PDT (-0700), jszhang@kernel.org wrote:
>>
>> > > >> Commit 3b90b09af5be ("riscv: Fix orphan section warnings caused by
>> > > >> kernel/pi") touches vmlinux.lds.S, so to make the merge easy, this
>> > > >> series is based on 6.4-rc2.
>> > > >
>> > > > Thanks.
>> > >
>> > > Sorry to be so slow here, but I think this is causing LLD to hang on
>> > > allmodconfig.  I'm still getting to the bottom of it, there's a few
>> > > other things I have in flight still.
>> >
>> > Confirmed with v3 on mainline (linux-next is pretty red at the moment).
>> > https://lore.kernel.org/linux-riscv/20230517082936.37563-1-falcon@tinylab.org/
>>
>> Just FYI Nick, there's been some concurrent work here from different
>> people working on the same thing & the v3 you linked (from Zhangjin) was
>> superseded by this v2 (from Jisheng).
>
> Ah! I've been testing the deprecated patch set, sorry I just looked on
> lore for "dead code" on riscv-linux and grabbed the first thread,
> without noticing the difference in authors or new version numbers for
> distinct series. ok, nevermind my noise.  I'll follow up with the
> correct patch set, sorry!

Ya, I hadn't even noticed the v3 because I pretty much only look at 
patchwork these days.  Like we talked about in IRC, I'm going to go test 
the merge of this one and see what's up -- I've got it staged at 
<https://git.kernel.org/pub/scm/linux/kernel/git/palmer/linux.git/commit/?h=for-next&id=1bd2963b21758a773206a1cb67c93e7a8ae8a195>, 
though that won't be a stable hash if it's actually broken...

>
>>
>> Cheers,
>> Conor.
>
>
>
> -- 
> Thanks,
> ~Nick Desaulniers
