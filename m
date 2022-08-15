Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4709B1C2B
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 14:37:27 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EF935C433C1
	for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 14:37:26 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=kernel.org;
	s=k20201202; t=1660574247;
	bh=jfrvV04fo3CiDMoOZUz//YjuoPU5jqF0lo7fGVNmS6U=;
	h=References:In-Reply-To:From:Date:Subject:To:Cc:From;
	b=jwWgDfp07buTWTWmsZJ0CAI7SV4tlCQBX2vx5fsYxi/UXEfUTddUH38Aml7jpdFGO
	 gWvAOSmv4kaz9gE3ZgPklkX3QxYHouHrYkdxBMhkRaxHIKAaF7EWWNBQYQ3tRUzPfp
	 c2Z5p99rxC/eTE7QMHvbFWqFGNIDSvHu0M6VAjpKFR7oDBRUXgwJnoVK3EVgBENyN5
	 CmpiJGfKGhzyEhD2kKx2TD4UkIoan8dagkS8Z0k8gSobihp6RfssVXc6oH50rrfpu6
	 t/AXyufDxi0+7kA4WgRUDcfjQCpRuaOkrE0RwpsKp4Up63179YloobepmkowLIA44b
	 MXNbzu/zW9QVw==
Received: by mail-ej1-f52.google.com with SMTP id qn6so13823862ejc.11
        for <llvm@lists.linux.dev>; Mon, 15 Aug 2022 07:37:26 -0700 (PDT)
X-Gm-Message-State: ACgBeo0ZbzSZ3F0v3PvA4FWnbegXGQsxVHa80yIgxquOG02iUcHLF9tR
	l9/VrhTOlwn1wXQM1D/IsDXnkEvWva4Gjc6F1ns=
X-Google-Smtp-Source: AA6agR6vrzYb3TEjxTFBSU4d93P6JzjjQ1A5kVds01mTuAqZHPQ5fQf3yKdccfyDXOnTTuKnwXZBgkpmyR27++RMNwY=
X-Received: by 2002:a17:907:960f:b0:731:1e3:b198 with SMTP id
 gb15-20020a170907960f00b0073101e3b198mr10726558ejc.470.1660574245159; Mon, 15
 Aug 2022 07:37:25 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202208140835.W6F1j6Da-lkp@intel.com> <Yvo8KUKJBlMtoNgI@casper.infradead.org>
 <CAK8P3a3Gx39P90k9ZUMdzHiNpjNn1tdvkTktQyzUqqfG+an4BA@mail.gmail.com>
 <YvpEkYMatTeNvNZa@casper.infradead.org> <CAK8P3a3=XC4ez-zeGptQb_9NtX5rVfr8Qq80eGaEckzUzjAxzg@mail.gmail.com>
In-Reply-To: <CAK8P3a3=XC4ez-zeGptQb_9NtX5rVfr8Qq80eGaEckzUzjAxzg@mail.gmail.com>
From: Arnd Bergmann <arnd@kernel.org>
Date: Mon, 15 Aug 2022 16:37:09 +0200
X-Gmail-Original-Message-ID: <CAK8P3a0TPYs2cbcx+0QGk=y8xjFrspdwnTHDxQCtsSwJmfvF6Q@mail.gmail.com>
Message-ID: <CAK8P3a0TPYs2cbcx+0QGk=y8xjFrspdwnTHDxQCtsSwJmfvF6Q@mail.gmail.com>
Subject: Re: fs/ntfs/aops.c:378:12: warning: stack frame size (2216) exceeds
 limit (1024) in 'ntfs_read_folio'
To: Matthew Wilcox <willy@infradead.org>
Cc: kernel test robot <lkp@intel.com>, llvm@lists.linux.dev, kbuild-all@lists.01.org, 
	linux-kernel@vger.kernel.org
Content-Type: text/plain; charset="UTF-8"

On Mon, Aug 15, 2022 at 3:48 PM Arnd Bergmann <arnd@kernel.org> wrote:

> I have no problems with a patch removing support for 256KB pages if that
> helps, as Hexagon is the only architecture to support this and there are close
> to zero Linux users anway. This would leave only three warnings for 64KB
> pages in allmodconfig:
>
> fs/mpage.c:131:20: error: stack frame size (1128) exceeds limit (1024)
> in 'do_mpage_readpage' [-Werror,-Wframe-larger-than]
> fs/mpage.c:447:12: error: stack frame size (1264) exceeds limit (1024)
> in '__mpage_writepage' [-Werror,-Wframe-larger-than]
> fs/ext4/readpage.c:223:5: error: stack frame size (1208) exceeds limit
> (1024) in 'ext4_mpage_readpages' [-Werror,-Wframe-larger-than]

I looked into these a bit more and found that these are arrays of sector_t,
which could be either 32-bit or 64-bit wide before 72deb455b5ec
("block: remove CONFIG_LBDAF"), but is now always 64-bit, so having
an array of 128 of these (65536/512) adds a 1KB to the stack and will
cause a warning. It's only slightly over the limit, and there are very few
32-bit systems that allow 64KB pages to trigger that warning.

I see now that ppc440 also supports 256KB pages and has the same
problem as hexagon, but also has been broken since the start of the
git history in this regard:

fs/mpage.c:638:1: error: the frame size of 4280 bytes is larger than
2048 bytes [-Werror=frame-larger-than=]

I don't know if anyone strongly cares about 256KB pages on
ppc44x any more, but given this, I'm fairly sure that they are
not using block based file systems. So we could just make
CONFIG_BLOCK depend on PAGE_SIZE_LESS_THAN_256KB
globally instead of dropping 256KB pages everywhere.

        Arnd
