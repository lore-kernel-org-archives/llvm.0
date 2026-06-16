Received: from mail-wr1-f54.google.com (mail-wr1-f54.google.com [209.85.221.54])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 6F8DD35F184
	for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 23:34:00 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=pass smtp.client-ip=209.85.221.54
ARC-Seal:i=2; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1781652841; cv=pass; b=glrQqminvGaU9WRu4kPiXH6TXP879fM/QmCZf76gdZZpNVeIpZ4i1/ddZkNY4uRZwsQgoGFddtRT9NUvl/3ZBEeNxbsHnJANRMsTNdeuKnHZH0fYoKMA7tqes25+4B8LmC7HyBPOnc1udZIuhQCyGdDL4TCOuhA+1FI1NP91KIo=
ARC-Message-Signature:i=2; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1781652841; c=relaxed/simple;
	bh=DKyvv7X/1O6yRPGIXxYIhYBpUwPyJTAh5/xcF5c7gS8=;
	h=MIME-Version:From:Date:Message-ID:Subject:To:Cc:Content-Type; b=ejcZjG2bYQOnWs+XacpeETg1XoX1IZEqesXQSVYvEuhBg6I4lqD5QTWwMa5UAK7ZOrmqWOJ32i1KJMDJDcx3VamPDXVs1DAzPXLZd5hVbyghXsgtoYh+Mw0YehEMixTgnAUjCUPp5RGrrVJSzGb7CWiwGT+OsO+RQXJkCZWhn0I=
ARC-Authentication-Results:i=2; smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com; spf=pass smtp.mailfrom=google.com; dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b=T66KjqCL; arc=pass smtp.client-ip=209.85.221.54
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=reject dis=none) header.from=google.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=google.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=google.com header.i=@google.com header.b="T66KjqCL"
Received: by mail-wr1-f54.google.com with SMTP id ffacd0b85a97d-460166910e6so2726970f8f.2
        for <llvm@lists.linux.dev>; Tue, 16 Jun 2026 16:34:00 -0700 (PDT)
ARC-Seal: i=1; a=rsa-sha256; t=1781652839; cv=none;
        d=google.com; s=arc-20240605;
        b=R11+vneECrty1HhUFyZuv8UqO1VKOId9SnFRM5+sjzkIMq8ZoxtT3RKVPJ4KEMCqDL
         bjh8iWhaXmz47g4i10mYCXpBPoAPaLGad3tynFuEGMvFBjRaPvtndwc+vQV5ohfbKohq
         oqKIS2BKS6fwSto8emQ11oB5KbSIcZLA7FfKw+Wr8W/Q5i4GpZJQYWZqhXG4Q1InWit2
         zivzBWxDzV/8iW9gQpfniormkiDbbi1SrTiMO1FUYWrl10/d7QX6wpE7atBFTl1lbRYc
         PScuB8+0kR9zw8nJUNSLRumgTYPehvMZ81li+h9IcTS1gC03SRdRMnVALBkwWcoTOKws
         SHbg==
ARC-Message-Signature: i=1; a=rsa-sha256; c=relaxed/relaxed; d=google.com; s=arc-20240605;
        h=cc:to:subject:message-id:date:from:mime-version:dkim-signature;
        bh=KsK+QKnuC5Vq0SpReeobu7Qpix4EALGeyH0amQRwOPQ=;
        fh=Q1rCdga5KEOqnwsZK1MmGZECVU38QS96EzyY5s2wL58=;
        b=BIQ9yfUhsF2Ki7lwyNEG1O4QEfKO5Gz6U/qwQ2pOcufTyQNdchQ/B1yiKjEvIuMs5f
         qm8qzPJSnKzNgt+DuIHQisiUJ6Mtkv8Cgb9l1MDS6T3KkPaatYjqJ02wAJKz1uOoKLih
         WezOXKZIHvleFD1R6HFybNw2E0UjcUlBTw4EMrhAEeNZWPBHqo309lYOUG7QR0ESWPVj
         EvhQgDcqOMBk6cJIejQlsCr+OLNY453XzIsxqyV6QNrlERHV0EOPbffvdo0FxrgYvX1e
         rSe0WGW3+YDvKiY5m8EmpTh8+sBCp0SSP1SdMYYV0kfW2KG7LA7mNzOsj9Jg8d2NVygu
         OqSw==;
        darn=lists.linux.dev
ARC-Authentication-Results: i=1; mx.google.com; arc=none
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=google.com; s=20251104; t=1781652839; x=1782257639; darn=lists.linux.dev;
        h=cc:to:subject:message-id:date:from:mime-version:from:to:cc:subject
         :date:message-id:reply-to;
        bh=KsK+QKnuC5Vq0SpReeobu7Qpix4EALGeyH0amQRwOPQ=;
        b=T66KjqCLCY7JP+UcrLrQJzcWH/cbo6ZDN0+/HuOoV2Q1eu6Wj+rhUSYvXHdTFspztX
         b/ylTyJqln61/c5jAZ2ntchoVcjmivE/3rgOxTfJkzwKwV+6iIQzuyfQs+V24lcnKVx4
         ywtdcuLPaT8sRm2Kv9ua25SLnZHi+0B2xxFjCrG84cpm4oaPurfSW9GCiTVJMe28APuN
         W7+FsUWLEZvrqiRhvlHerl4OqYLjMIeRxELlHOS5glTfEeQLSijJ9eJrOz8CZHDuzzuw
         5kFOHVhPu9wt6j8HjZLHl57JRWGpE6W3s9YS+eYjZS5KlvqEPA9R1t3xTMJ2FW6tcYPL
         l7ZQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20251104; t=1781652839; x=1782257639;
        h=cc:to:subject:message-id:date:from:mime-version:x-gm-gg
         :x-gm-message-state:from:to:cc:subject:date:message-id:reply-to;
        bh=KsK+QKnuC5Vq0SpReeobu7Qpix4EALGeyH0amQRwOPQ=;
        b=S0WVjM4ia78v9m/Vp97LKFXPmbEIx7pwbAr21thgsKtpFEGxHYezvf+J0hja5C0PHj
         SLRwGOgrPHs/7H/QhXJKrBFml+/tWfXPqVW6ApQqpmTxsE4APinhf+KwR3DrkpDf/u/E
         9OrUUUtjOY0ZHI6Bwy4APhTjhAup1Vt7+rOiBI0Cg+5K4kGmWROwAfLSNMNnmlVp8ckd
         hEH8CB+Gaq3EMWaOhAVPCr3e5mTT0bthx5XYvohJ0nlqF+XjiqJtgKY8un/b5o2J1PLj
         Hwu92fTXr2swRAA2Tp2OFRopSOfUr65R+0Y3g+PNNo+CHIRd8A0spc+yY6BjpolWVCYW
         d/1w==
X-Gm-Message-State: AOJu0Yz3iOTkAYxsFOQGy1m5Z3sgNFmPIPHmLg11ffJbkzSXSL7Nh6SS
	hE9II9lmCpPFmvRStl59jPd8yMUJyWDACXPj4PCSa//Z3PcU9hl8Jkf55a4CiCzchmcC4rkj13B
	pb790vn7hwZ55wTWgg+AF0pxmlRkqgmSlWIaFrI2bKCeFF8eNji+SSsMIXLY=
X-Gm-Gg: AfdE7ckBoU0PU1khVseBKwTQZrbrnFi7S4VRzH2NeZsWRiNQocx5Uq5tTECW8PbWQMR
	N94ce6mqBMIz5F6C2lg5awYmCjPgd20UyTO8YidXPH8nn5wIf90rx+TMK4rkGXD1wUOoEL+5pvz
	n8CFpa2u9qzk2ocmPIHsz5Teky0Ntd9slLTVaREJM5jxGMjkRSPvlmHXy/SyRLy0FX4YtUGw5GM
	/FQGviOiCg9awcBepuDTHUcYJtBLiwip7p/MAs+i6sBvKLwXzN+NkJUQaWJkmz2doNQRi7o998D
	NDcHV5+c3wkw2bznhSEb8FYiCZKpznPEq5fFhQ==
X-Received: by 2002:a05:6000:4023:b0:43c:fc5c:a9fe with SMTP id
 ffacd0b85a97d-46238ac9fc7mr2706693f8f.20.1781652838343; Tue, 16 Jun 2026
 16:33:58 -0700 (PDT)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
From: Nick Desaulniers <ndesaulniers@google.com>
Date: Tue, 16 Jun 2026 16:33:46 -0700
X-Gm-Features: AVVi8Cd1Pv0u-agErODGGz4n0VeOE5HBOiwCTfSeg8OAKyD6UT5oVpWjALN_F0s
Message-ID: <CAKwvOdm3w0TbDHL3JwBH3YUAQrc6gVr9Vp1fDAQj1xcCu1gaqQ@mail.gmail.com>
Subject: CFP: Toolchains Track at Linux Plumbers Conf '26
To: clang-built-linux <llvm@lists.linux.dev>, LKML <linux-kernel@vger.kernel.org>, 
	rust-for-linux <rust-for-linux@vger.kernel.org>
Cc: "Jose E. Marchesi" <jemarch@gnu.org>
Content-Type: text/plain; charset="UTF-8"

My colleague Jose Marchesi and I would like to announce that the Call
For Papers (CFP) is now open for the Toolchains Track at Linux
Plumbers Conference 2026.

This year, Plumbers will take place in Prague, Czechia from Monday
October 5th to Wednesday October 7th.  Please see
https://lpc.events/event/20/ for more info
about the event.

The aim of the Toolchains track is to fix particular toolchain issues
which are of the interest of the kernel and, ideally, find solutions
in situ, making the best use of the opportunity of live discussion
with kernel developers and maintainers. In particular, this is not
about presenting research nor abstract/miscellaneous toolchain work.

The track will be composed of activities, of variable length depending
on the topic being discussed. Each activity is intended to cover a
particular topic or issue involving both the Linux kernel and one or
more of its associated toolchains and development tools. This includes
compiling, linking, assemblers, debuggers and debugging formats, ABI
analysis tools, object manipulation, applied machine learning, etc.
Few slides shall be necessary, and most of the time shall be devoted to
actual discussion, brainstorming and seeking agreement.

To submit a proposal, please visit the below.  Click "Submit new
abstract" then make sure to select "Toolchains Track" under the
"Track" dropdown.

https://lpc.events/event/20/abstracts/

Submissions close: 24 July 2026 - Speakers notified: from 31 July 2026

We look forward to submissions, and hope to see you there!

-- 
Thanks,
~Nick Desaulniers
