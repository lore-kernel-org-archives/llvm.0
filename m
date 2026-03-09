Received: from mail-pl1-f169.google.com (mail-pl1-f169.google.com [209.85.214.169])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 91DAC3E123D
	for <llvm@lists.linux.dev>; Mon,  9 Mar 2026 15:59:48 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.214.169
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1773071990; cv=none; b=YESkASq0u8ragl61F4KB3E5JJ5SC4Fgp2AeqTwR80RyiZ45NT2ckUUASKpJjel/7rI6HWkTga6tLw62brRP8GvYCNfcRMnaCXx4PHUvTg5QaRKeceOtlP5JEG+1urtwyJ2De6DYDigAkHkisbJGBQtZzoVWEU6X1XawIJGYogYE=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1773071990; c=relaxed/simple;
	bh=lxBJyqGJiol9HEpza28/mPltLmrDdSsX1VZdrScZvFw=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MWpSUYBgKfZyVaBX8dKaLM5Z25bl9jwa7heIpTGE9mWNPFsRw1quPxpt+KI6tdqZa8XItI+gCCaQS90XYFxil8QEkzXtYhYT7sWkGTZ2Cid9GgybHVCYpBkh37xD3Pw96IvZBXqdNMqStI6zwFjxKncbawelvpYcv9hdjZn3FnU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=V8w6iQ2Z; arc=none smtp.client-ip=209.85.214.169
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="V8w6iQ2Z"
Received: by mail-pl1-f169.google.com with SMTP id d9443c01a7336-2ab46931cf1so81245095ad.0
        for <llvm@lists.linux.dev>; Mon, 09 Mar 2026 08:59:48 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1773071988; x=1773676788; darn=lists.linux.dev;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:from:to:cc:subject:date
         :message-id:reply-to;
        bh=lxBJyqGJiol9HEpza28/mPltLmrDdSsX1VZdrScZvFw=;
        b=V8w6iQ2ZaRdnjZ3UOBs+fNHQPBcyNuoP0NwgcclAJKGoGOMySDooX3J1vbNVLffrgT
         AhHF69cXhAVoRLjjXwSDNf2HjUhjfnD7xPxAZH9AaKqjg1NbpLZ8wkojh5tVP8Wu8aFI
         iq/n9N6St76h6OyrgytdT2osBjrP/IoKil+d2IFY9s4jKuuX/D6SDwchGh7setsDpUm7
         86V3Bqx1sJDguvLEsf9EvI9MhJnHy0OqUf+WAfGEGx8rujjT7VokyUyw+nxSByUk3z3N
         qbyUulVAvD6mbpBqOUQScrzZhMd1n8YcWqYI3yWXpD9R6WmDA9CAePXm8oDj7dwlyyiJ
         g1jQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1773071988; x=1773676788;
        h=content-transfer-encoding:mime-version:references:in-reply-to
         :message-id:date:subject:cc:to:from:x-gm-gg:x-gm-message-state:from
         :to:cc:subject:date:message-id:reply-to;
        bh=lxBJyqGJiol9HEpza28/mPltLmrDdSsX1VZdrScZvFw=;
        b=gqpuhoqvRSeyvHsKTTAce49JPKf4Z2PdfTgP/kfDr4EJB2M6hdF1ZLxKv+cGcAlO34
         x4GXlFdenIOkRz7ThrevkMZcdDIZaMoIuXgva4qmXW/u0AqVrv7DyaWSqUU+cWg5UIV2
         gBS2Y/PmbZfefAEgKMFjc3fEZO0MIGHNS5bb98ZrK9ntnqQzp+BHisZh+kzhxQo6Z+e/
         qT1J/qa3L40wbsRTsRKS+NzOVONZe9gW0+0Vtay6SErE+v61/jzz+6u2QgRR0Ax4oI+f
         u5JTF3bl+LGbF1fXUaAFcaf4JcW+WE+IOZAy7xYJY5y4odJtGfiWF5GDiYD3tI4KIu75
         o4Tg==
X-Forwarded-Encrypted: i=1; AJvYcCWjvKJ4eflx+wBXguDJOzViS7DeOc0/Tigz/GyY7yS/fKKme6r9hnR97TwiSntA7QhqBHJL@lists.linux.dev
X-Gm-Message-State: AOJu0YykSSe7Y9gz+7eI2MeY0PijeUQK+n71c6Fu6mH01RQ+gmtZvK9q
	MX2D/Kr2Wwqn4XoA1NHl81+S1UPus1HIO1Io3zknLXGqd6eEZBqcldTp
X-Gm-Gg: ATEYQzwI9y5Kl5CZuYzh8eM+wNa5R4x4M6kYFd8fpLwkBPgbluTgtCa9ys+ZQqssUG0
	HSHp/YPfoFZWwA+OCAbYUdxVTNFbiqj/ezBmRKbJ8dRj7SpyNErX7kaxQlu6CgJF6Kp8PVxsFpK
	hlvLdb6zUUrK+DyvNQd0sTMeEGwuQAbe/iLvRxSooOVefkuMYFEwI7d9hMvAf368ZY70xiCf1q4
	YaPE//3zVvz2546tMBCdTFHt4RMrt29p0AgybwweSNDf/kkCVh6P0kEgef3Bfr0xoFW+tG5A1T+
	gYzFPEJe9yDd5w0xidFGvC/Kef2LCPvqSSL6bTWGXSY0Te6AXEoZiEctBmrTNBu4ebyng6AuwAr
	b1j/q7wo4tgTuS/dsWnujdSXOJlyBxwJorGg4haG2sHZ9pVtEF90D+OIeFB5pNoJxcI1slTDjE5
	BheSR3K4lfJ6PJF5SptRNaxnMUxtHVJfXI6RDD5Z+XMqA=
X-Received: by 2002:a17:902:e892:b0:2ae:4da9:afce with SMTP id d9443c01a7336-2aea1e1b6bemr505155ad.23.1773071987450;
        Mon, 09 Mar 2026 08:59:47 -0700 (PDT)
Received: from DESKTOP-3LEPQG8.localdomain ([119.28.20.50])
        by smtp.gmail.com with ESMTPSA id d9443c01a7336-2ae83f8a629sm144852655ad.62.2026.03.09.08.59.39
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 09 Mar 2026 08:59:47 -0700 (PDT)
From: Xie Yuanbin <qq570070308@gmail.com>
To: willy@infradead.org
Cc: Liam.Howlett@oracle.com,
	akpm@linux-foundation.org,
	david.laight.linux@gmail.com,
	david@kernel.org,
	justinstitt@google.com,
	linux-kernel@vger.kernel.org,
	linux-mm@kvack.org,
	ljs@kernel.org,
	llvm@lists.linux.dev,
	mhocko@suse.com,
	morbo@google.com,
	nathan@kernel.org,
	nick.desaulniers+lkml@gmail.com,
	qq570070308@gmail.com,
	rppt@kernel.org,
	surenb@google.com,
	vbabka@kernel.org
Subject: Re: [PATCH] mm: optimize the implementation of WARN_ON_ONCE_GFP()
Date: Mon,  9 Mar 2026 23:59:33 +0800
Message-ID: <20260309155933.41179-1-qq570070308@gmail.com>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <aa7p3eQfEuh2wObQ@casper.infradead.org>
References: <aa7p3eQfEuh2wObQ@casper.infradead.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

On Mon, 9 Mar 2026 15:40:13 +0000, Matthew Wilcox wrote:
>On Mon, Mar 09, 2026 at 11:38:11PM +0800, Xie Yuanbin wrote:
>> As shown in the commit message of commit 242b872239f6a7deacbc
>> ("include/linux/once_lite.h: fix judgment in WARN_ONCE with clang"),
>> the code "unlikely(a && b)" may generate poor assembly code if it is
>> actually "unlikely(a) && unlikely(b)" or "unlikely(a) && b".
>
> Why fix this in multiple places in the kernel instead of once in clang?

If a and b is both unlikely, then "unlikely(a) && unlikely(b)" will
generate better code than "unlikely(a && b)". This is also true for gcc.

As for the issue of clang judging twice, I have already submitted it to
clang:
Link: https://github.com/llvm/llvm-project/issues/167117
However, even if clang fixes it, this optimization will not be merged
back to the old version of clang.
