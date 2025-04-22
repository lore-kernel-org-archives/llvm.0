Received: from mail-qv1-f53.google.com (mail-qv1-f53.google.com [209.85.219.53])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 46FAC28541A
	for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 14:25:55 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.219.53
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1745331957; cv=none; b=QHsYHgMyLLyHytN+BPpQF8Uykkjs0xLk6vGKBN0+l/QDgdvGqRRCYzYezyoS86AnF2s0bqmDpvw3GeLXTcNoo/Uv3r62ndp8aqWW0L5eEU/OUOQDsIEL9oQKPHnSVs77VwoeCq8gZ4GK9mdgJWcWieIDanZvx3yBhM07d9ZVt+s=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1745331957; c=relaxed/simple;
	bh=tjtbHzwoboY5NTxcDNdJTdRaGicnX4Nne3QqBjODEsU=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=flW95K9VsxY+kK82Bt8joFHx59vvRVsTOaMaEmFYNP3gGUFxZvEr2hgrTU/8erFjJIKyN2DM/mdL5OUq+WyDpsCP5fpU00kkEsYLT7DqXYW92ouQBnh1HnURYkhZal5kgGe003stSnMbKW9Hq/Wf3uM/EcSjs32E2DubkFm/9Fo=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=gH3/aGN0; arc=none smtp.client-ip=209.85.219.53
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="gH3/aGN0"
Received: by mail-qv1-f53.google.com with SMTP id 6a1803df08f44-6e8f8657f29so48870326d6.3
        for <llvm@lists.linux.dev>; Tue, 22 Apr 2025 07:25:55 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1745331955; x=1745936755; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=/AA5KErGXnyWxPr67XnMS/Iu/vkfGkM2cePR5H4DX4I=;
        b=gH3/aGN0QjME0uxccdEkwFo/ELLsp5Yc6NJ666dCPBybl+cddQxMN3ZIxhogo1mo5m
         Qzmbi7cZ4dlzK6cWFS2SiUaVgpJQIOFUOyp+cVbmABTHO4orbSwanD4zsHdCh+jj8uHi
         KLJi1cu5FFYPyp8Mz13aQOpaGzmrDDdlg4unUmciIZis1b9W1fZyFSVf+xd+DYiPYaq8
         7YawvMA3GOxn+hs8Kn/CGPJVIffi1LU2e5CEVvYPk9vciUU6HI/v2yBEWluya0EP7CEo
         N0ZEwD9+yYMGYdFw8RW6ld/dDy4BM9cXohfFN9fqC4aXLORodT4TuuIillsNN8anYyxL
         gibQ==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1745331955; x=1745936755;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=/AA5KErGXnyWxPr67XnMS/Iu/vkfGkM2cePR5H4DX4I=;
        b=K1YileLwZAaptWaAj57u3q0FUCNneeNgzAsxR9F/hndm5A0qMIq6cOLnYG0VXj7ixt
         3gPdSom5pIiQxI4yGvDhyivvX0raY2sxgHcGhJr2tDJW80w0iJKjzaGdnLzoAJILphMl
         Zt4gZkm0BG13xy8XmCPmKs7gsVM5puELj50snWO++2c09t39jDk92t5BlBYP0eALjLer
         WsoCOMZh0gFVhHAX92SSwYH1mbHENMJDcLKp7aw8OkoiXfnfEn+tIYh1rbeF2uIz1u1N
         UcK0VTsoYw09QCTuoKn+Vuu5RxxLqXWm7a2Gy0A354l9Z+16sQ/76zgXrNFOL8U/Kpwg
         pSxA==
X-Forwarded-Encrypted: i=1; AJvYcCVMiBn2tYw0MO5127ABHrgWx64uzLfQnxrTU8hUs4PGCsjdf4er7UlHFaRu604JNW/rY+k9@lists.linux.dev
X-Gm-Message-State: AOJu0YwM4A7Iey5lsvCEwtaMW/R73SUh44Z9rWSVWtWNkK1aNuP1RFhl
	byhAjlfXjkJIQgZnX31/4kIJSYroUCyYcbpnoPYF/iwRkeczwCw1
X-Gm-Gg: ASbGncuZ36oLXTYxuQj/RBf+xegy/m3Q/qFXXwhBG7lbiQN6FbrNYNhNW0bsGTt9sJ2
	N5b99e3KHL6UXC13wJIr7JSw7FZJSKKflgwLB7TYXixhey2BK0iPTdI83fMHeQsHvE6Si3esgAy
	l5kO10aqSjRXJzAWe7P+nFWLukmzwixs1A7l6bVx11v7OMcnjf5T0KYnhdlDgLTN60iLUspOPqr
	rgeGiFUhoo0fv00/nmNw85V3q3fKhmimb7jAWUhA0WZ4MM8assB2grCif5RsdKYNbLrkPkaygen
	Jj67qzrAH3txdKOjMju8ZfU8OSDmZj3S/ue5UIsM8EkU7zm2CgPJtQC2Orts72bLdPBcpyZSVUc
	cLFdrQ5lsWTsAzNVIwR0tK2K9y5PmwY8=
X-Google-Smtp-Source: AGHT+IEAUoX6oEASeQSpF+Thmrw4GKI/Ho/FyOqrb7X2iQhszzbErfs9CuDJ/hJKgwKf7hqNNI5v9w==
X-Received: by 2002:a05:6214:23c6:b0:6ea:d393:962f with SMTP id 6a1803df08f44-6f2c453aa96mr257641586d6.16.1745331954714;
        Tue, 22 Apr 2025 07:25:54 -0700 (PDT)
Received: from fauth-a1-smtp.messagingengine.com (fauth-a1-smtp.messagingengine.com. [103.168.172.200])
        by smtp.gmail.com with ESMTPSA id 6a1803df08f44-6f2c2b0cb46sm58736436d6.27.2025.04.22.07.25.53
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Tue, 22 Apr 2025 07:25:54 -0700 (PDT)
Received: from phl-compute-02.internal (phl-compute-02.phl.internal [10.202.2.42])
	by mailfauth.phl.internal (Postfix) with ESMTP id A246A120006A;
	Tue, 22 Apr 2025 10:25:53 -0400 (EDT)
Received: from phl-mailfrontend-02 ([10.202.2.163])
  by phl-compute-02.internal (MEProxy); Tue, 22 Apr 2025 10:25:53 -0400
X-ME-Sender: <xms:8aYHaDlej0Uw2eqzN0UnK9fSFXHdKDzWG6ikLl84v_YyTrhLuvS1Qg>
    <xme:8aYHaG1wNP-lCbgArHwaIJ3UVq-Kp9Q3yyA0s9ieXjVaj_-hjz8-NF7tJ962epzhK
    xqPRsPatrUIztMQAg>
X-ME-Received: <xmr:8aYHaJokMuilYxBdqaq6DWYchKyJPv3lZ9RZCJ4ebxOGj5JNEVk8hT9O>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgddvgeefleeiucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeetgedujeejudehveekteetfeefhfffheet
    gfeugfetffekieetiedtudehgfffgfenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghenucevlhhushhtvghrufhiiigvpedtnecurfgrrhgrmhepmhgr
    ihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrshhonhgrlhhithihqd
    eiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghngheppehgmhgrihhl
    rdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepvddtpdhmohguvgepsh
    hmthhpohhuthdprhgtphhtthhopehkuhhnfihurdgthhgrnheslhhinhhugidruggvvhdp
    rhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtphhtthhopegrlhgvgi
    drghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgrrhihsehgrghrhihg
    uhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhrohhtohhnmhgrihhlrd
    gtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhhothhonhdrmhgvpdhr
    tghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrghdprhgtphhtthhope
    grlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthhopehtmhhgrhhoshhs
    sehumhhitghhrdgvughu
X-ME-Proxy: <xmx:8aYHaLldF3ltUZZuTxR_22T7pdycDxzWHF2DyL__IH7yq4olLVqXzQ>
    <xmx:8aYHaB3i9p1EQLPO0qRRiIdvMGK1UrrQkyzCEctUmhtqJ6T9U54pNQ>
    <xmx:8aYHaKvw5ipu8GAVskGnKrUYguurDO4tHDcE4N32Ffm6rCoGUuYm3Q>
    <xmx:8aYHaFWsz1oM7kEGnPmBGHV7UyzVI0bd-HbYlk_9aJuXu1Z56Fd4Kw>
    <xmx:8aYHaA2LTdyXIWYK7a_1NrGixuj-p2RO3VV37DEU2QGnE_x-kBXuxS8a>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Tue,
 22 Apr 2025 10:25:53 -0400 (EDT)
Date: Tue, 22 Apr 2025 07:25:52 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Kunwu Chan <kunwu.chan@linux.dev>
Cc: ojeda@kernel.org, alex.gaynor@gmail.com, gary@garyguo.net,
	bjorn3_gh@protonmail.com, benno.lossin@proton.me,
	a.hindborg@kernel.org, aliceryhl@google.com, tmgross@umich.edu,
	dakr@kernel.org, nathan@kernel.org, nick.desaulniers+lkml@gmail.com,
	morbo@google.com, justinstitt@google.com,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Kunwu Chan <kunwu.chan@hotmail.com>,
	Grace Deng <Grace.Deng006@gmail.com>
Subject: Re: [PATCH v2] rust: sync: optimize rust symbol generation for
 CondVar
Message-ID: <aAem8H4WhLBTf3xv@Mac.home>
References: <20250324061835.1693125-1-kunwu.chan@linux.dev>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250324061835.1693125-1-kunwu.chan@linux.dev>

On Mon, Mar 24, 2025 at 02:18:34PM +0800, Kunwu Chan wrote:
> From: Kunwu Chan <kunwu.chan@hotmail.com>
> 
> When build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> with ARCH=arm64, the following symbols are generated:
> 
> $nm vmlinux | grep ' _R'.*CondVar | rustfilt
> ... T <kernel::sync::condvar::CondVar>::notify_all
> ... T <kernel::sync::condvar::CondVar>::notify_one
> ... T <kernel::sync::condvar::CondVar>::notify_sync
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::condvar::CondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar>::new::{closure#0}::{closure#0}::panic_cold_explicit
> ... T <kernel::sync::poll::PollCondVar as core::ops::drop::Drop>::drop
> 
> These notify_* symbols are trivial wrappers around the C functions
> __wake_up and __wake_up_sync. It doesn't make sense to go through
> a trivial wrapper for these functions, so mark them inline.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Suggested-by: Alice Ryhl <aliceryhl@google.com>
> Co-developed-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Grace Deng <Grace.Deng006@Gmail.com>
> Signed-off-by: Kunwu Chan <kunwu.chan@hotmail.com>
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> 

I'm taking this via tip with the version as it is (i.e. no #[inline] for
notify()), but will reorder the tags. Thanks!

Regards,
Boqun

> ---
> Changes in v2:
> - Remove '#[inline]' for notify()
> - Reword commit msg
> - v1 link: https://lore.kernel.org/rust-for-linux/01c67d96-6477-4851-81ae-0cbee3b9e893@linux.dev
> ---
>  rust/kernel/sync/condvar.rs | 3 +++
>  1 file changed, 3 insertions(+)
> 
> diff --git a/rust/kernel/sync/condvar.rs b/rust/kernel/sync/condvar.rs
> index caebf03f553b..c6ec64295c9f 100644
> --- a/rust/kernel/sync/condvar.rs
> +++ b/rust/kernel/sync/condvar.rs
> @@ -216,6 +216,7 @@ fn notify(&self, count: c_int) {
>      /// This method behaves like `notify_one`, except that it hints to the scheduler that the
>      /// current thread is about to go to sleep, so it should schedule the target thread on the same
>      /// CPU.
> +    #[inline]
>      pub fn notify_sync(&self) {
>          // SAFETY: `wait_queue_head` points to valid memory.
>          unsafe { bindings::__wake_up_sync(self.wait_queue_head.get(), TASK_NORMAL) };
> @@ -225,6 +226,7 @@ pub fn notify_sync(&self) {
>      ///
>      /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
>      /// completely (as opposed to automatically waking up the next waiter).
> +    #[inline]
>      pub fn notify_one(&self) {
>          self.notify(1);
>      }
> @@ -233,6 +235,7 @@ pub fn notify_one(&self) {
>      ///
>      /// This is not 'sticky' in the sense that if no thread is waiting, the notification is lost
>      /// completely (as opposed to automatically waking up the next waiter).
> +    #[inline]
>      pub fn notify_all(&self) {
>          self.notify(0);
>      }
> -- 
> 2.43.0
> 
> 
