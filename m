Received: from mail-qk1-f180.google.com (mail-qk1-f180.google.com [209.85.222.180])
	(using TLSv1.2 with cipher ECDHE-RSA-AES128-GCM-SHA256 (128/128 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 8602E3595D
	for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 18:17:43 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=209.85.222.180
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742753865; cv=none; b=CMRW5sLmbKqTxT+iaPFxngvxmhm5a+J2Y5YD6ePnvZdfwMtiyDyYvGbTTxK3PEI2wi6xOpntwXLnxhSEhbnCVCb8hnyb3wKzkOgk397h9nZUm9bosKHT9p0QP9d9shWHuHJ6Ot32rVD+jHcyitZP6GjvJwxMm+PC6ZPCfYDSMaI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742753865; c=relaxed/simple;
	bh=rWj6WocXKBI0ugd9aAJVs40NDcWgGwovZXjcXknYzRg=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=c+W0yYjNb0sPQC6fykZDMhO7VginPiEVqWt6LPrs4YUoylzP/1f04vvsPZfvKuINr/TEd15MGQs84waQUBBiAOWxtVjA5X3kB4UataagKbXXGqCptDZ6Nw9Rt11JEXu60IxJ0uXbb4KhRpRT8jIImOTXuAH7wb0t3AhO8Rfmdqg=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com; spf=pass smtp.mailfrom=gmail.com; dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b=PxZk0y1A; arc=none smtp.client-ip=209.85.222.180
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=gmail.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=gmail.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=gmail.com header.i=@gmail.com header.b="PxZk0y1A"
Received: by mail-qk1-f180.google.com with SMTP id af79cd13be357-7c542ffec37so395882685a.2
        for <llvm@lists.linux.dev>; Sun, 23 Mar 2025 11:17:43 -0700 (PDT)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=gmail.com; s=20230601; t=1742753862; x=1743358662; darn=lists.linux.dev;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:from:to:cc:subject:date
         :message-id:reply-to;
        bh=p/Y3e2AAeYJ+Z6UX18Ug8YutlfvErNn61p0TdO5dpWc=;
        b=PxZk0y1AA7ZeWZb5gTi3he4HwQ+gEzvKeEWe68BU/TegM8zCElshUeDqlJ+893Tisq
         D0j7prIx/2L/KBlBvL1rLmMw1cL/+v+HLV93rGKnGNtBl5ZEKh4cUTgY/Iihfa78maUt
         xOLFYCpOmyc/fP5EAvnsmciMEOsIjTCyXpjzntVyjzD66IDFhtoczrVurgBSl0gXkJz2
         7aPMngZztlhRfIMi/MYhrney4jFHOd18qjKbsg8gz2Cfcb6SbRSSjCMBdZa1L3FyAEh6
         ymuKHPsgOqKDLaBjcRwBNIIg3wegpHrV5FZCh+T9fnVrVTuutDxfQfAJeBwV8sa1L95U
         X6vw==
X-Google-DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed;
        d=1e100.net; s=20230601; t=1742753862; x=1743358662;
        h=in-reply-to:content-disposition:mime-version:references:message-id
         :subject:cc:to:from:date:feedback-id:x-gm-message-state:from:to:cc
         :subject:date:message-id:reply-to;
        bh=p/Y3e2AAeYJ+Z6UX18Ug8YutlfvErNn61p0TdO5dpWc=;
        b=tNZM2SkhVzeDGg1TbUw7VNJJl23vavP+AJqAE0qUirIR0txMwEzlCHV01L4twM6maN
         C2tRCxT9Ahj2dowf4GZB5ZfF+ugjfkk1HQZi3BohM3T+gYvwtMkGBJSmqGo7nvtVOCEr
         Be0rkEIpdgSqvXzp3LBFOVR0HEU0UHvlH6J+k/SRTnbhLV5dKNhwJT79zlO5covNeBQy
         xLxNAWC3xKvEKgIcEM+S/5b+g2DTIYh2W/rm5e+DV6mRX+G+kWLnMrHNZrwIFxZo1vSR
         XkEHiwgffSCypWHv46qW8uWN8VVPNXHpVv92hfZThloWyqBHSfPQf4i99QyQVv1P9Mld
         LhCA==
X-Forwarded-Encrypted: i=1; AJvYcCVQa2MnNv6/W0iOPhQgs1AsNc8E0+4Z3ciOvoPZjRLoJjT46risFBMUIMDrFhrW4/q+yS8d@lists.linux.dev
X-Gm-Message-State: AOJu0YxRe5O9qZXykGsqnFZSKAaC/yeg983ypIIIYw7eC9v0ywlyOEGT
	Q+r1FHTwzRsNKh0BbtlszZc8ek6Ie2f/ceyTeoI3zNe6+XTBVa3f
X-Gm-Gg: ASbGncsyy8attAMOVUOHXJ4/5GL1X0nXOfNazz9Kgq09NNXFCGNHXU3CYwD3JkLFslu
	2he4wu/7qeHsv5dBEFy51Ud9+q25oIoZnVIdUWDP5za4rmJTaL+epqzJ7hqlmthZeTc8TSqZh+Y
	slNYuIl5bLFywwFqMuCODMWcd5Y6sUGSjyqJa2NbjuJT2+RWkrAZ2XeUzfnhzZHbYjEGLVwHDmX
	hjm51lP9ncNHXEv5qPw8k+X8MS8iGIl9pG6MMYnhzQVuAVwdP2bH9/7zekSzMdU8kLCm5EpaCNx
	DagYnqbZyZHmDgRNG4n1b8aJ4GJ+RTi9cgeAb24nmbgQuM+0Yr4FK0IHOUXJKomclfsHvuQ/Jwr
	YuRSa+4jlssPv0tXUE5ks0OrmMNkIhn+qusA=
X-Google-Smtp-Source: AGHT+IFmNBhDriRO0irUBdJRjzDqYZ9meEjROmFEBD5cu7z9FsdbJP1sRzp13mrQ+HhLSXJk9YEvXg==
X-Received: by 2002:a05:620a:1924:b0:7c5:431f:f5e6 with SMTP id af79cd13be357-7c5ba1a7d8dmr1304857585a.33.1742753862268;
        Sun, 23 Mar 2025 11:17:42 -0700 (PDT)
Received: from fauth-a2-smtp.messagingengine.com (fauth-a2-smtp.messagingengine.com. [103.168.172.201])
        by smtp.gmail.com with ESMTPSA id af79cd13be357-7c5b92b9af5sm391763585a.6.2025.03.23.11.17.41
        (version=TLS1_3 cipher=TLS_AES_256_GCM_SHA384 bits=256/256);
        Sun, 23 Mar 2025 11:17:41 -0700 (PDT)
Received: from phl-compute-13.internal (phl-compute-13.phl.internal [10.202.2.53])
	by mailfauth.phl.internal (Postfix) with ESMTP id 169CB1200069;
	Sun, 23 Mar 2025 14:17:41 -0400 (EDT)
Received: from phl-mailfrontend-01 ([10.202.2.162])
  by phl-compute-13.internal (MEProxy); Sun, 23 Mar 2025 14:17:41 -0400
X-ME-Sender: <xms:RFDgZ6m1jzHkA2GKcyVudDR3ZiTcIOAM-q89Ykwq_ilVkw15c6TbnA>
    <xme:RFDgZx1LKIVV_r5scPmj7A9_5FaL_F_hi7biDzbGy9CDz17BfTJMDk_J7XwVFghHP
    5COZTPN-LivGbeKNw>
X-ME-Received: <xmr:RFDgZ4phwEEqks6BVb-QDo0qN34-BkQmAc9ebTXeRrNuxjLGL6kLQyRl>
X-ME-Proxy-Cause: gggruggvucftvghtrhhoucdtuddrgeefvddrtddtgdduheejheejucetufdoteggodetrf
    dotffvucfrrhhofhhilhgvmecuhfgrshhtofgrihhlpdggtfgfnhhsuhgsshgtrhhisggv
    pdfurfetoffkrfgpnffqhgenuceurghilhhouhhtmecufedttdenucesvcftvggtihhpih
    gvnhhtshculddquddttddmnecujfgurhepfffhvfevuffkfhggtggujgesthdtredttddt
    vdenucfhrhhomhepuehoqhhunhcuhfgvnhhguceosghoqhhunhdrfhgvnhhgsehgmhgrih
    hlrdgtohhmqeenucggtffrrghtthgvrhhnpeefueeigfegueffveeltefgiefgtdegtddv
    jeefieffhfelvefhleehiedvjeehieenucffohhmrghinhepghhithhhuhgsrdgtohhmpd
    hkvghrnhgvlhdrohhrghdptggrshhtrdgrshenucevlhhushhtvghrufhiiigvpedtnecu
    rfgrrhgrmhepmhgrihhlfhhrohhmpegsohhquhhnodhmvghsmhhtphgruhhthhhpvghrsh
    honhgrlhhithihqdeiledvgeehtdeigedqudejjeekheehhedvqdgsohhquhhnrdhfvghn
    gheppehgmhgrihhlrdgtohhmsehfihigmhgvrdhnrghmvgdpnhgspghrtghpthhtohepud
    elpdhmohguvgepshhmthhpohhuthdprhgtphhtthhopehpfhholhhirgguihhssehpohhs
    thgvohdrnhgvthdprhgtphhtthhopehojhgvuggrsehkvghrnhgvlhdrohhrghdprhgtph
    htthhopegrlhgvgidrghgrhihnohhrsehgmhgrihhlrdgtohhmpdhrtghpthhtohepghgr
    rhihsehgrghrhihguhhordhnvghtpdhrtghpthhtohepsghjohhrnhefpghghhesphhroh
    htohhnmhgrihhlrdgtohhmpdhrtghpthhtohepsggvnhhnohdrlhhoshhsihhnsehprhho
    thhonhdrmhgvpdhrtghpthhtoheprgdrhhhinhgusghorhhgsehkvghrnhgvlhdrohhrgh
    dprhgtphhtthhopegrlhhitggvrhihhhhlsehgohhoghhlvgdrtghomhdprhgtphhtthho
    pehtmhhgrhhoshhssehumhhitghhrdgvughu
X-ME-Proxy: <xmx:RVDgZ-nvprKGYwGviVukxwhl22kEnivIylvsl_zS_rtdR1p6PG3Frw>
    <xmx:RVDgZ41Ar4HEjGg4TF8943ZqDo1LTjgMyUQm3rHum6fJM8QYjQV2yA>
    <xmx:RVDgZ1vGf_TkFJGUI2DwZG7C_s5SR-OSPctKTSJw1ZaV2rOSDb9hIw>
    <xmx:RVDgZ0XIHh92VZKCvt7fQEDPIIcsaWa-k4PqqU3DD0TFYGZFwOPmFQ>
    <xmx:RVDgZz0QVmZYR0t0XWMoIyL0rN0YZ_bk-OC5CXPmGerJsGORRcI3MIj2>
Feedback-ID: iad51458e:Fastmail
Received: by mail.messagingengine.com (Postfix) with ESMTPA; Sun,
 23 Mar 2025 14:17:40 -0400 (EDT)
Date: Sun, 23 Mar 2025 11:17:39 -0700
From: Boqun Feng <boqun.feng@gmail.com>
To: Panagiotis Foliadis <pfoliadis@posteo.net>
Cc: Miguel Ojeda <ojeda@kernel.org>, Alex Gaynor <alex.gaynor@gmail.com>,
	Gary Guo <gary@garyguo.net>,
	=?iso-8859-1?Q?Bj=F6rn?= Roy Baron <bjorn3_gh@protonmail.com>,
	Benno Lossin <benno.lossin@proton.me>,
	Andreas Hindborg <a.hindborg@kernel.org>,
	Alice Ryhl <aliceryhl@google.com>, Trevor Gross <tmgross@umich.edu>,
	Nathan Chancellor <nathan@kernel.org>,
	Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	rust-for-linux@vger.kernel.org, linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev, Christian Schrefl <chrisi.schrefl@gmail.com>,
	Charalampos Mitrodimas <charmitro@posteo.net>
Subject: Re: [PATCH v3] rust: task: mark Task methods inline
Message-ID: <Z-BQQwHHgediSaTt@Mac.home>
References: <20250315-inline-c-wrappers-v3-1-048e43fcef7d@posteo.net>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20250315-inline-c-wrappers-v3-1-048e43fcef7d@posteo.net>

On Sat, Mar 15, 2025 at 12:23:01PM +0000, Panagiotis Foliadis wrote:
> When you build the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
> toolchain provided by kernel.org, the following symbols are generated:
> 
> $ nm vmlinux | grep ' _R'.*Task | rustfilt
> ffffffff817b2d30 T <kernel::task::Task>::get_pid_ns
> ffffffff817b2d50 T <kernel::task::Task>::tgid_nr_ns
> ffffffff817b2c90 T <kernel::task::Task>::current_pid_ns
> ffffffff817b2d00 T <kernel::task::Task>::signal_pending
> ffffffff817b2cc0 T <kernel::task::Task>::uid
> ffffffff817b2ce0 T <kernel::task::Task>::euid
> ffffffff817b2c70 T <kernel::task::Task>::current
> ffffffff817b2d70 T <kernel::task::Task>::wake_up
> ffffffff817b2db0 T <kernel::task::Task as kernel::types::AlwaysRefCounted>::dec_ref
> ffffffff817b2d90 T <kernel::task::Task as kernel::types::AlwaysRefCounted>::inc_ref
> 
> These Rust symbols are trivial wrappers around the C functions
> get_pid_ns, task_tgid_nr_ns, task_active_pid_ns, signal_pending, uid,
> euid, get_current, wake_up, get_task_struct and put_task_struct. It
> doesn't make sense to go through a trivial wrapper for these
> functions, so mark them inline.
> 
> After applying this patch, the above command will produce no output.
> 
> Link: https://github.com/Rust-for-Linux/linux/issues/1145
> Reviewed-by: Benno Lossin <benno.lossin@proton.me>
> Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
> Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>
> Reviewed-by: Alice Ryhl <aliceryhl@google.com>
> Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>

I queued this for v6.16 via tip and more tests and reviews, thank you
all. I changed a bit in the commit log per the usual tip tree rules,
please see below, and let me know if something doesn't look good to you.

Regards,
Boqun

-------------------------->8
From: Panagiotis Foliadis <pfoliadis@posteo.net>
Date: Sat, 15 Mar 2025 12:23:01 +0000
Subject: [PATCH] rust: task: Mark Task methods inline

When building the kernel using the llvm-18.1.3-rust-1.85.0-x86_64
toolchain provided by kernel.org, the following symbols are generated:

$ nm vmlinux | grep ' _R'.*Task | rustfilt
... T <kernel::task::Task>::get_pid_ns
... T <kernel::task::Task>::tgid_nr_ns
... T <kernel::task::Task>::current_pid_ns
... T <kernel::task::Task>::signal_pending
... T <kernel::task::Task>::uid
... T <kernel::task::Task>::euid
... T <kernel::task::Task>::current
... T <kernel::task::Task>::wake_up
... T <kernel::task::Task as kernel::types::AlwaysRefCounted>::dec_ref
... T <kernel::task::Task as kernel::types::AlwaysRefCounted>::inc_ref

These Rust symbols are trivial wrappers around the C functions. It
doesn't make sense to go through a trivial wrapper for these functions,
so mark them inline.

[boqun: Capitalize the title, reword a bit to avoid listing all the C
functions as the code already shows them and remove the addresses of the
symbols in the commit log as they are different from build to build]

Link: https://github.com/Rust-for-Linux/linux/issues/1145
Reviewed-by: Benno Lossin <benno.lossin@proton.me>
Reviewed-by: Christian Schrefl <chrisi.schrefl@gmail.com>
Reviewed-by: Charalampos Mitrodimas <charmitro@posteo.net>
Reviewed-by: Alice Ryhl <aliceryhl@google.com>
Signed-off-by: Panagiotis Foliadis <pfoliadis@posteo.net>
Signed-off-by: Boqun Feng <boqun.feng@gmail.com>
Link: https://lore.kernel.org/r/20250315-inline-c-wrappers-v3-1-048e43fcef7d@posteo.net
---
 rust/kernel/task.rs | 10 ++++++++++
 1 file changed, 10 insertions(+)

diff --git a/rust/kernel/task.rs b/rust/kernel/task.rs
index ea43a3b8d9c5..6ba0b4286f09 100644
--- a/rust/kernel/task.rs
+++ b/rust/kernel/task.rs
@@ -134,6 +134,7 @@ pub fn current_raw() -> *mut bindings::task_struct {
     /// # Safety
     ///
     /// Callers must ensure that the returned object doesn't outlive the current task/thread.
+    #[inline]
     pub unsafe fn current() -> impl Deref<Target = Task> {
         struct TaskRef<'a> {
             task: &'a Task,
@@ -168,6 +169,7 @@ fn deref(&self) -> &Self::Target {
     /// # Safety
     ///
     /// Callers must ensure that the returned object doesn't outlive the current task/thread.
+    #[inline]
     pub unsafe fn current_pid_ns() -> impl Deref<Target = PidNamespace> {
         struct PidNamespaceRef<'a> {
             task: &'a PidNamespace,
@@ -275,24 +277,28 @@ pub fn pid(&self) -> Pid {
     }
 
     /// Returns the UID of the given task.
+    #[inline]
     pub fn uid(&self) -> Kuid {
         // SAFETY: It's always safe to call `task_uid` on a valid task.
         Kuid::from_raw(unsafe { bindings::task_uid(self.as_ptr()) })
     }
 
     /// Returns the effective UID of the given task.
+    #[inline]
     pub fn euid(&self) -> Kuid {
         // SAFETY: It's always safe to call `task_euid` on a valid task.
         Kuid::from_raw(unsafe { bindings::task_euid(self.as_ptr()) })
     }
 
     /// Determines whether the given task has pending signals.
+    #[inline]
     pub fn signal_pending(&self) -> bool {
         // SAFETY: It's always safe to call `signal_pending` on a valid task.
         unsafe { bindings::signal_pending(self.as_ptr()) != 0 }
     }
 
     /// Returns task's pid namespace with elevated reference count
+    #[inline]
     pub fn get_pid_ns(&self) -> Option<ARef<PidNamespace>> {
         // SAFETY: By the type invariant, we know that `self.0` is valid.
         let ptr = unsafe { bindings::task_get_pid_ns(self.as_ptr()) };
@@ -308,6 +314,7 @@ pub fn get_pid_ns(&self) -> Option<ARef<PidNamespace>> {
 
     /// Returns the given task's pid in the provided pid namespace.
     #[doc(alias = "task_tgid_nr_ns")]
+    #[inline]
     pub fn tgid_nr_ns(&self, pidns: Option<&PidNamespace>) -> Pid {
         let pidns = match pidns {
             Some(pidns) => pidns.as_ptr(),
@@ -321,6 +328,7 @@ pub fn tgid_nr_ns(&self, pidns: Option<&PidNamespace>) -> Pid {
     }
 
     /// Wakes up the task.
+    #[inline]
     pub fn wake_up(&self) {
         // SAFETY: It's always safe to call `signal_pending` on a valid task, even if the task
         // running.
@@ -330,11 +338,13 @@ pub fn wake_up(&self) {
 
 // SAFETY: The type invariants guarantee that `Task` is always refcounted.
 unsafe impl crate::types::AlwaysRefCounted for Task {
+    #[inline]
     fn inc_ref(&self) {
         // SAFETY: The existence of a shared reference means that the refcount is nonzero.
         unsafe { bindings::get_task_struct(self.as_ptr()) };
     }
 
+    #[inline]
     unsafe fn dec_ref(obj: ptr::NonNull<Self>) {
         // SAFETY: The safety requirements guarantee that the refcount is nonzero.
         unsafe { bindings::put_task_struct(obj.cast().as_ptr()) }
-- 
2.39.5 (Apple Git-154)

