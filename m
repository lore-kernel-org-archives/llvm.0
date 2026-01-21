Received: from mail-dl1-f44.google.com (mail-dl1-f44.google.com [74.125.82.44])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1882B26B756
	for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 08:31:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=74.125.82.44
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1768984274; cv=pass; b=dL2ntmO/mOQOZjTDUjICPq3R17v5pdCtxAyXY0bDM8wqzW7MeDRaNXFAX3BcBjoXNIFS5zvd/khbD6PN6LJiDZ4UIijpGsoM8xqxZZ8QR/u7byNeVMlg8Z2s31wSEQ8emTxFYkAyezjima/3lXyz3S7W0/oYIXhlJWSs317bBoY=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1768984274; c=relaxed/simple;
	bh=XFctc9YUZofxB3tz/N/xWCk2r/4c4qsA5rmg4d5qxv4=;
	h=MIME-Version:References:In-Reply-To:From:Date:Message-ID:Subject:
	 To:Cc:Content-Type; b=B0c7b3li7zkTHeNHxrAf39eL474KAXsJkKiPvQC889FlbUzBclI68xdAaBmGISTI6HAvFhIuhSBKN/KtLQDCxDbVUKy9X1Zrd3pDVa3cJDHQPvg5o7jo6KtY6KcE5QHcfDLQOQ2QPXVMHFhATjkcGFtY99ozAE25x2LLLxneP9o=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=lvR1bTKA; arc=pass smtp.client-ip=74.125.82.44
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="lvR1bTKA"
Received: by mail-dl1-f44.google.com with SMTP id a92af1059eb24-1233c155a42so8101988c88.1
        for <llvm@lists.linux.dev>; Wed, 21 Jan 2026 00:31:12 -0800 (PST)
ARC-Seal: i=1; a=rsa-sha256; t=1768984272; cv=none;
        d=google.com; s=arc-20240605;
        b=Ix2bRgmBI50P4DUgnXoqxY1aZlqtANyBsWvUFtN4bz/PZkCQfdQsRj4sTPbnwICKla
         oQSx84YhZHiQcRC+2x8KvlaRwHafzMYKOYiVgMNwlxK6hvT2QoIvk8F5VgcbhDnAAWMW
         cMnP89c0f78qJ9bGTY+u7GoldQibX80GwyftEiLQxMA0Ezp5laIywpIXN8F+3baiEuvC
         D5B7lFTQWXz71xlo7Q3CrOne9FCynpm99qO63GVnHznrQMdetxKzGs0aV7Q4rTQCaejI
         1GeCeEhz/cut4c+e9SHhJ1vvgpHA6A52DGOWPFu8jZa0l577K8bBlrYfH57gerIVhJz6
         UFIQ==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:dkim-signature;
        bh=P42aspcTRdBvvY2weJyVYtPiuSH8JxKCfznzt5gGMzI=;
        fh=IUUmr91KHpESx03wYA7Wc22Ieieu+EJFx6Q9XtQiSPM=;
        b=YJxUWfdlsGCQpVGX5VEckL0oMosbbE9jB5+4uNzYVKSKnL7rnnXBh0/42sir7Xy9rD
         sthLxHjQTYAtfpvOJcloBnREYZPnsphZeuM0xOBr4cj64OJEGsho0ZrLYoo0mn9A1EZ2
         8deIWCnvd/28hDFXifVvMR2qn++NCpMmx3KuJGIY/voW7uPXx9yYjVCL1lee66Js4DaB
         +y+6QF/p0e37p4aWI9BjEmWcoAP3320sr3qxjbvMGWVPRj2k4Dzm83FT0cVN1qTyDDPx
         RNtPp7Tq5Iw0AFzY5k0jLNBhQI4JyN5GmfQMZf60tw+voqC8FZ9nSwtBn/3l/6C1sF8B
         mSiQ==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20230601; t=1768984272; x=1769589072; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:from:to:cc:subject:date:message-id:reply-to;
        bh=P42aspcTRdBvvY2weJyVYtPiuSH8JxKCfznzt5gGMzI=;
        b=lvR1bTKAiNzTSY+HbA8WAnwfhWd5Yvl1G+tQFBEQbLnxg2Y2OWie696KS5c7OpgyP2
         eNmL1ZOJeq3A5SueL5KPtYXdDdE7U8CHTOMznmqvXZRdu1E52ip6oclYT3h1Ot0hc7CA
         Q6aAySl+tuHjkMhyVrqt5HkAmR2NRNh61quAIgMtnSy2L4rjdeo6dyk2bX2a2L7e89jf
         QqGaDmOAn7zugRyFfK4TlewJ24LrlPJW57MHr0M0QZMcBwTL6Lb6GOGBBKjM7ZCyHL2S
         9YPNzk8jzypw7s87YZW1ITJ4pRJ0PAqgXnG8sMMMOC0QwzV9Pd0kQRf9xLAH4cTrFpaE
         tuTw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1768984272; x=1769589072;
        h=cc:to:subject:message-id:date:from:in-reply-to:references
         :mime-version:x-gm-gg:x-gm-message-state:from:to:cc:subject:date
         :message-id:reply-to;
        bh=P42aspcTRdBvvY2weJyVYtPiuSH8JxKCfznzt5gGMzI=;
        b=C8HIQl8HZuQZilfZNez95ZiFRXyCo0Vm/2xswIz+lCya8vcpDWuZQMyfRWNTHqXBo9
         2gMsccAb5sKRaoUN6ds9WsQGDhdypWLqszM48bONOlRYc6f6YtNzcoSJmOeplJJx6iwC
         RRMNqW7PiV5p3IrSI5PDH/zS/OEYoiBXHkiAKqYPvNduWsKFLcCqYb1sIPJTQc1O9/vn
         f1P3EVXPcOYeya+rKft5970K7AtAYyW52noTBboi9SYTQDyyKGqfAs5hI8ovVXuTLr0W
         r5JKLPFv5edg6EICtEQOP3+6hDsGhZBgxg+HlNulMGqCf6ichOApwnUYD+pcOyMtyebl
         QwEA==
X-Gm-Message-State: AOJu0YzXjvu6vCSyuWcNemiNyWUMu62e9mEe/DydePN18J+QNGLzFIv1
	DNeytfOEcmSP7ZaEQzOGyFons3BnKML09eZGmwMLkFRVXJ2SGtQ17NuB5oLBIioQFsRiKuzvRRc
	74VxE1QCQOuO6Ko5vn8Vf9S9NrMwBoEt24JhlEkXA
X-Gm-Gg: AZuq6aKdOunMJHB0UbpELoEHu4ndZAbsjEIBzIHd7Y8ku1cfAOBKZrdZshlyB2HQsv9
	w011G5INADy3lnRrLtrPYhGQBqSDlLIUHWcn/xuWo+Bnqh1cOINyKi3L2ibSyXxkwb4Tfv+k/A2
	2QeDT38kJGOznY4SZohxwtdy/AJ+AhS09Fc3GZWkP2oXzMkRfFBst0Gbh9yojW/at4R6a7Pn+6w
	sL7CL8MOv+QQ6Q+31g0F7PX4S4T/q4XtLGkJpz5ZGNZDj06qG2C9mLbWJ5gpUPaAUWJk7KSQYy4
	p06jaQa8Fs49R3VZtl4NBKd5kA==
X-Received: by 2002:a05:7022:394:b0:11b:923d:7735 with SMTP id
 a92af1059eb24-1246a9583ecmr2889558c88.1.1768984271429; Wed, 21 Jan 2026
 00:31:11 -0800 (PST)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
References: <202601211136.rAqSN4rF-lkp@intel.com>
In-Reply-To: <202601211136.rAqSN4rF-lkp@intel.com>
From: Marco Elver <elver@google.com>
Date: Wed, 21 Jan 2026 09:30:35 +0100
X-Gm-Features: AZwV_QgziV2Y0oUsHCXWDkVLLE1tcXx1ZQ5AONgUo0HiZEfFrVHEcJbtRDBbvQ8
Message-ID: <CANpmjNOCwW7K2iWZh4g6y+DV8edb9noRULKBeP+Q7oa4NOFRiA@mail.gmail.com>
Subject: Re: [tip:locking/core 20/43] include/linux/rmap.h:123:1: warning:
 rw_semaphore 'anon_vma->root->rwsem' is still held at the end of function
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev, 
	linux-kernel@vger.kernel.org, x86@kernel.org, 
	Peter Zijlstra <peterz@infradead.org>
Content-Type: text/plain; charset="UTF-8"

On Wed, 21 Jan 2026 at 04:23, kernel test robot <lkp@intel.com> wrote:
>
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/tip/tip.git locking/core
> head:   ccf9e070116a81d29aae30db501d562c8efd1ed8
> commit: e4fd3be884cf33a42c5bcde087b0722a5b8f25ca [20/43] locking/rwsem: Support Clang's context analysis
> config: s390-randconfig-002-20260121 (https://download.01.org/0day-ci/archive/20260121/202601211136.rAqSN4rF-lkp@intel.com/config)
> compiler: clang version 22.0.0git (https://github.com/llvm/llvm-project 9b8addffa70cee5b2acc5454712d9cf78ce45710)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260121/202601211136.rAqSN4rF-lkp@intel.com/reproduce)
>
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202601211136.rAqSN4rF-lkp@intel.com/
>
> All warnings (new ones prefixed by >>):
>
>    include/linux/fs.h:1083:1: warning: rw_semaphore 'mapping->invalidate_lock' is still held at the end of function [-Wthread-safety-analysis]
>     1083 | }

This is a CONFIG_WARN_CONTEXT_ANALYSIS_ALL=y build; that option
depends !COMPILE_TEST, which is not set for this compile test it
appears.
So this seems to be WAI.
