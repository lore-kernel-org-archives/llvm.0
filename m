Received: from mail-qv1-f46.google.com (mail-qv1-f46.google.com [209.85.219.46])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id F06F424501B
	for <llvm@lists.linux.dev>; Mon, 30 Jun 2025 13:50:33 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.46
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1751291435; cv=none; b=oXU3z2PJpYvWaOAeZHNt5gYiyvW0LDNUZshFEPRM+hDl41AZQwGOkR8/xbvcRjpfCPa+O4wZcMaOzhS4Brmsp29vplYaNgaqDA2Hw8KxRCaO8U3BRVG63+L8emsYCL9bKsk7HaK5iolt65xeN2SkvsqW3nglZZMyWvPABRzg4z4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1751291435; c=relaxed/simple;
	bh=IQVhGSw27mbrhh2Uwszh19QwB+gQgLHGxJNAYOIfAUE=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=Ev5J8RQtDwoMYpJfRrz1r7X9kpttKdLy3WMlk3WVuA039agzuEJdgxevih+nAU7MrjWWWkVhxIt2+Qry0mKBlZ/S8lsj8oSm2nhIAOwV+YvPuodZhB63maCSqH0PquIbHlKIVhExZJSs1bmIp+zHPTZCKfBDQFB1YNoA/P69ORE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=D+AXv7JJ; arc=none smtp.client-ip=209.85.219.46
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="D+AXv7JJ"
Received: by mail-qv1-f46.google.com with SMTP id 6a1803df08f44-6fafaa60889so9646806d6.3
        for <llvm@lists.linux.dev>; Mon, 30 Jun 2025 06:50:33 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1751291433; x=1751896233; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=N5Lb9XyF7dArjU8ijxNd19g2e4SY59XNR0KZZKcVnQQ=;
        b=D+AXv7JJPAsn1obf9meCz7ONcu+dkpu8QYfduxhxozBYydIn8fmTOnB0dnPnzaCXBb
         cOQ6T6SxYeJ3pMg4psuLXhO183GZ8a7MkMBn9s0Tyr1JvoIo8fka/O3jN6tMWCzAXyuw
         dQZfmPCdeGIRqpQYRbrqBBMAq975p24Mj+d2fGNiS0I/iroY4le5JLhYIwx4lOyOvt4H
         o+8pVCO/nBR1kjo/vo6kN8H+MH3dW/m91QTm2HEZ6uuVsAcLM8SmUNgD9sGa3i77sKuK
         LPYdbMzipmfSAJxIZbwASx919DFtPya9s1e3+OHEbmBLepNjUH29iSJOh7v9xo5/EBec
         4NCw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1751291433; x=1751896233;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=N5Lb9XyF7dArjU8ijxNd19g2e4SY59XNR0KZZKcVnQQ=;
        b=ZEH4OFJwquCmpM31EInrCRU11xf8mO8t9UPL0xOgNexHyCaOq/46/GHfQRrcZC+8Sa
         h9yv46PXCcs2jBivW1M4og6Nh9HafPNOBOY5UwCtcQ+Dgeq2KSVp/EIZ/a4NHlZbEDHU
         LRAeUoklw4mhBWFisWwVcv2DS/tfJlXbe5F5F7GcZo+zccbfUlR2viZ++rlyh2dBVLmN
         u8x9JoxvZ8xpF4RmtYqe2rwSV38rwNUBc7ak7KW3p/M3yHdbK/W56JPE8CpPdoQE6L0y
         q+5s43dCOiS8oa8Jx+Fq1A5XQZEljcbq02SsAptmejMWHVrbeEZKt36QbXxmmvTNzXhE
         03Gg==
X-Forwarded-Encrypted: i=1; AJvYcCXtr2iCn7xgPRNDDk7iyAxRRt+LfYTU/puCRKEmzrfw/NDElVPXqvteKb8SRukDlkOqZi0n@lists.linux.dev
X-Gm-Message-State: AOJu0YyZZzzC+/ltmJIMG/8nUfXBKN1GRWG5HceVIjZl/qfuS8alFfzG
	qNYsmn0niVDt2abxWk9Yexn2hkjofLx5+zZyy6wfTGN+009EIvDMnSc+
X-Gm-Gg: ASbGncvierLAYSJIs429FLwu9sXQsAeNCbfIrdWD8L4XgawcZ0/mL8x89bAFqv8jHOr
	Pqj8Ec939V6RGhuLTTjo7hk9JUS+6g8i81wtNT9nRZlnb90MZUHn2/DQdz1siOFApG6YULyVy6d
	UVymCJj3gkgfLIbVyuO+3jO15xm9iVbCfhXqAEYP/jzHuZB5kROavbtHw6c79r97VWW6d6LtipG
	qvVY9iYRSNDQa5gLQYjhgo0wx0//3AvYIUqKCDb5Oim/gT0jh9LEFnzVJrq0/hqe5NP9i2sz/G0
	9ZLsoDHcXM2EdW3qG4vDc1pHBsrUAwJxBvoC9j84gQgtw5LctUWI3KI8aSuALArmCHt3Hphhcil
	bRte0thJUOJTzqZBWF+MP4DFDa4vw/IxrzHxo8kQM/ajsyCTz5bYR
X-Google-Smtp-Source: AGHT+IEHxeGpLNvKFW1gWPsvXXwQLIfBdOzO4xQXmaXIvW3hINkG5Lb3gWbZJ55wDEeX5PNX6IYdqQ==
X-Received: by 2002:a05:6214:76f:b0:6fa:c81a:6204 with SMTP id 6a1803df08f44-6fffdcff257mr195938466d6.10.1751291432568;
        Mon, 30 Jun 2025 06:50:32 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6fd7718d8f2sm68154456d6.23.2025.06.30.06.50.26
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Mon, 30 Jun 2025 06:50:28 -0700 (PDT)
Received: from phl-compute-06.internal (phl-compute-06.phl.internal [10.202.2.46])
	by mailfauth.phl.internal (Postfix) with ESMTP id 24AEEF40066;
	Mon, 30 Jun 2025 09:50:26 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-06.internal (MEProxy); Mon, 30 Jun 2025 09:50:26 -0400
X-ME-Sender: <xms:IpZiaK1guDOH7SmL4XT_MroNhCJtGq9O-mSASHLW9HgsuJjT-nGGwQ>
    <xme:IpZiaNGzzhlRHUL5l6VTOwdhl9vj6S6TuLsjOrhx33TjWyQVMj0mp7WmUFe3rRX6x
    ra9ug2ouqJLrW6-XQ>
X-ME-Received: <xmr:IpZiaC6unKwSHMhWsd-3QhRgTcUo3ggbnQwvPlNPz6thLwyLmn4aUHkImQ>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeeffedrtdefgdduudekjecutefuodetggdotefrod
    ftvfcurfhrohhfihhlvgemucfhrghsthforghilhdpuffrtefokffrpgfnqfghnecuuegr
    ihhlohhuthemuceftddtnecusecvtfgvtghiphhivghnthhsucdlqddutddtmdenucfjug
    hrpeffhffvvefukfhfgggtuggjsehttdertddttddvnecuhfhrohhmpeeuohhquhhnucfh
    vghnghcuoegsohhquhhnrdhfvghnghesghhmrghilhdrtghomheqnecuggftrfgrthhtvg
    hrnhephfetvdfgtdeukedvkeeiteeiteejieehvdetheduudejvdektdekfeegvddvhedt
    necuffhomhgrihhnpehkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtne
    curfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghr
    shhonhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvg
    hngheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohep
    feehpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehmihhnghhosehkvghrnhgvlh
    drohhrghdprhgtphhtthhopehpvghtvghriiesihhnfhhrrgguvggrugdrohhrghdprhgt
    phhtthhopehmihhnghhosehrvgguhhgrthdrtghomhdprhgtphhtthhopehjuhhrihdrlh
    gvlhhlihesrhgvughhrghtrdgtohhmpdhrtghpthhtohepvhhinhgtvghnthdrghhuihht
    thhotheslhhinhgrrhhordhorhhgpdhrtghpthhtohepughivghtmhgrrhdrvghgghgvmh
    grnhhnsegrrhhmrdgtohhmpdhrtghpthhtoheprhhoshhtvgguthesghhoohgumhhishdr
    ohhrghdprhgtphhtthhopegsshgvghgrlhhlsehgohhoghhlvgdrtghomhdprhgtphhtth
    hopehmghhorhhmrghnsehsuhhsvgdruggv
X-ME-Proxy: <xmx:IpZiaL3pfv5C-L8GiSrTyFayQftmx5D6SfPZ9AEAd-tMNIHODA4QPA>
    <xmx:IpZiaNEXif6gWn7z1G3LnIF5N4A7kDuaXo7bHnwovfv1o7ayjxaFeg>
    <xmx:IpZiaE-GVz9OC470fbW0XQ7IbsLuU8t-yrSZdvV-DpoSFlsrOEsalA>
    <xmx:IpZiaCm7YGAZvjzBatdIIymAhDzx9vg4lxZhGDzmxStRnNz-0cbWlg>
    <xmx:IpZiaFFT0xHuCvNQvEdFBMIsoGSLWN6pvZ4qEkzvYnvF5qOh-m34U5Ij>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Mon,
 30 Jun 2025 09:50:25 -0400 (EDT)
Date: Mon, 30 Jun 2025 06:50:24 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Ingo Molnar <mingo@kernel.org>, Peter Zijlstra <peterz@infradead.org>
Cc: Ingo Molnar <mingo@redhat.com>, Juri Lelli <juri.lelli@redhat.com>,
	Vincent Guittot <vincent.guittot@linaro.org>,
	Dietmar Eggemann <dietmar.eggemann@arm.com>,
	Steven Rostedt <rostedt@goodmis.org>,	Ben Segall <bsegall@google.com>,
 Mel Gorman <mgorman@suse.de>,	Valentin Schneider <vschneid@redhat.com>,
	Miguel Ojeda <ojeda@kernel.org>,	Alex Gaynor <alex.gaynor@gmail.com>,
 Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Danilo Krummrich <dakr@kernel.org>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,	Justin Stitt <justinstitt@google.com>,
	FUJITA Tomonori <fujita.tomonori@gmail.com>,
	Tamir Duberstein <tamird@gmail.com>,	Kunwu Chan <kunwu.chan@hotmail.com>,
	Mitchell Levy <levymitchell0@gmail.com>,
	Martin Rodriguez Reboredo <yakoyoku@gmail.com>,
	Borys Tyran <borys.tyran@protonmail.com>,
	Christian Brauner <brauner@kernel.org>,
	Panagiotis Foliadis <pfoliadis@posteo.net>,	linux-kernel@vger.kernel.org,
 rust-for-linux@vger.kernel.org,	llvm@lists.linux.dev
Subject: Re: [GIT PULL] [PATCH v2 0/5] rust: Task & schedule related changes
 for v6.17
Message-ID: <aGKWIFVl4nwSl8SG@Mac.home>
References: <20250625051518.15255-1-boqun.feng@gmail.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250625051518.15255-1-boqun.feng@gmail.com>

On Tue, Jun 24, 2025 at 10:15:13PM -0700, Boqun Feng wrote:
> Hi Ingo & Peter,
> 
> This is the updated version from my pull request last cycle:
> 
> v1: https://lore.kernel.org/rust-for-linux/20250506045843.51258-1-boqun.feng@gmail.com/
> 
> Please take a look, thanks!
> 

Ping ;-) I forgot to add that this is a dependency for Rust version's
read_poll_timeout(), which is a dependency to a few things:

* In the `Tyr` driver:

  https://lore.kernel.org/rust-for-linux/20250628.224928.690831629261546521.fujita.tomonori@gmail.com/

* In Nova, the gpu driver:

  https://lore.kernel.org/rust-for-linux/20250619-nova-frts-v6-24-ecf41ef99252@nvidia.com/

* In the qt2025 phy driver:

  https://lore.kernel.org/lkml/20250220070611.214262-9-fujita.tomonori@gmail.com/

Thanks!

Regards,
Boqun

> Changes since v1:
> 
> - `Location::file_with_nul()` is used to avoid the C changes of
>   __might_sleep()
> 
> Regards,
> Boqun
> 
> 
> The following changes since commit 5bc34be478d09c4d16009e665e020ad0fcd0deea:
> 
>   sched/core: Reorganize cgroup bandwidth control interface file writes (2025-06-18 13:59:57 +0200)
> 
> are available in the Git repository at:
> 
>   git://git.kernel.org/pub/scm/linux/kernel/git/boqun/linux.git tags/rust-sched.2025.06.24
> 
> for you to fetch changes up to 7e611710acf966df1e14bcf4e067385e38e549a1:
> 
>   rust: task: Add Rust version of might_sleep() (2025-06-24 15:53:50 -0700)
> 
> ----------------------------------------------------------------
> Rust task & schedule changes for v6.17:
> 
> - Make Task, CondVar and PollCondVar methods inline to avoid unnecessary
>   function calls
> 
> - Add might_sleep() support for Rust code: Rust's "#[track_caller]"
>   mechanism is used so that Rust's might_sleep() doesn't need to be
>   defined as a macro
> 
> ----------------------------------------------------------------
> Boqun Feng (1):
>   rust: Introduce file_from_location()
> 
> FUJITA Tomonori (1):
>   rust: task: Add Rust version of might_sleep()
> 
> Kunwu Chan (2):
>   rust: sync: Mark CondVar::notify_*() inline
>   rust: sync: Mark PollCondVar::drop() inline
> 
> Panagiotis Foliadis (1):
>   rust: task: Mark Task methods inline
> 
>  init/Kconfig                |  3 +++
>  rust/helpers/task.c         |  6 +++++
>  rust/kernel/lib.rs          | 48 +++++++++++++++++++++++++++++++++++++
>  rust/kernel/sync/condvar.rs |  3 +++
>  rust/kernel/sync/poll.rs    |  1 +
>  rust/kernel/task.rs         | 33 +++++++++++++++++++++++++
>  6 files changed, 94 insertions(+)
> 
> -- 
> 2.39.5 (Apple Git-154)
> 
