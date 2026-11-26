Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.remote-ip=100.103.45.18
ARC-Seal: i=1; d=subspace.kernel.org; s=arc20261015; a=rsa-sha256; cv=none;
	t=1795731291;
	b=PJmSY1ZdFQNrX7IEsgzmQ5rVN9EjXiUUE80fGZ3SeXwBqfKhYlDV4b/Ij94Kpy9v0A1R
	 mTIYVn5lvSe+GATgv7bmuRXfQ4NID7HcIoY4RveUXVHKRhDP5W07sd/qSdtB6qBgAqycw
	 n85SYPRXw2kIVCvzs9MorxAfVhyyeqooe8RUCRNYOVnSnmRbf4HiyOL4EEZw8Y4T8xNnV
	 UIvwPlUpQHblTX/0AZcCGH5FHM8zjcSDPQDCYvQbeJ1zOhPGF47/BCZPezV4r0yJvurSo
	 vAZXXPQ98TPvWtxtdx68oBbrCDgTd6Whhlgw8n+q+ZpjO9pS5q0vzlOvbXP39W8CFMw==
ARC-Message-Signature: i=1; d=subspace.kernel.org; s=arc20261015;
	a=rsa-sha256; c=relaxed/relaxed; t=1795731291;
	h=Received:DKIM-Signature:From:Date:Subject:MIME-Version:Content-Type:
	 Content-Transfer-Encoding:Message-Id:X-B4-Tracking:X-Change-ID:To:Cc:
	 X-Mailer:X-Developer-Signature:X-Developer-Key;
	bh=PIbjNaa3If8KcL8wWiYRghgT7w+vn59i80YcfgEdDJU=;
	b=Pgmg1WS32H/2w9x6qbkuXWgskvkuUZM/rf3Junm5rzw5bpJkTyN2dvmEvb9ZZz1a7Tfa
	 7KYFPIWViUK8ccaCdiyglqlFpkKeWLwNzeV3NI6SckyLmt6Tz0ZJLSgt9mjSbGhjan0cp
	 5ae9FrUmoL6IcjYdNEIAcQ+Fwt+/VaJdlN7gd6v+Dv93lyGMOR4iCkFK6iQG5WEoueXRc
	 NIhCESMSm9w4KKCWT7BJ63RRgbYn1Jd6UrYOWFHkHhWkb6gG1CQka7yVM3uan76kWiyUK
	 vE2ht929yOm3J5gAZ0lVTlOLEueR8cGMrgwgQuuKhL3hBKpRnqc27Ji5Rch8s+bOwTg==
ARC-Authentication-Results: i=1; smtp.subspace.kernel.org; 
	dkim=pass header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AU+oYUVz;
	arc=none smtp.remote-ip=100.103.45.18
Received: from smtp.kernel.org (quasi.space.kernel.org [100.103.45.18])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature ECDSA (prime256v1))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0E991606A31E;
	Thu, 26 Nov 2026 22:14:51 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.a=rsa-sha256 header.s=k20260515 header.b=AU+oYUVz
Received: by smtp.kernel.org (Postfix) with ESMTPSA id A58111F00893;
	Thu, 26 Nov 2026 22:14:47 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1795731290;
	bh=PIbjNaa3If8KcL8wWiYRghgT7w+vn59i80YcfgEdDJU=;
	h=From:Date:Subject:To:Cc;
	b=AU+oYUVzb6DXyU6N3k/kpc7NNljJ9QNz9aH7y01uoAUForsHTX3Vw3uK2jegO7QKf
	 0kBXsl6d0PR7S1a5LJwL5kco/+1M7gYzCBoRlo4RGixpXi7XUFEtO8iECNGWXamLWS
	 wRwu2kKbiIXkCd2SH5kKUsxrnKLMvMemmvxjTTNLjmNDAucC9HsZnpSkRyA22e+qtA
	 UegeNRkY6bc+BGadx2suRK6mgQqzP0wBFem+2RT72C2tn44RR8nk2e9OMK9mxUDnfD
	 xUhghcfWK6cvvq0oWEKp8mUzZbi+5KR/y/dZuS1+0xeOxsaUiKxRpsfwnevn4OPbA0
	 tJaQtzFtrTXWg==
From: "Lorenzo Stoakes (ARM)" <ljs@kernel.org>
Date: Thu, 26 Nov 2026 22:14:43 +0000
Subject: [PATCH v2] locking/rwsem: don't let readers retain the lock past a
 queued writer
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Post: <mailto:llvm@lists.linux.dev>
List-Help: <mailto:llvm+help@lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
List-Owner: <mailto:llvm+owner@lists.linux.dev>
Precedence: list
MIME-Version: 1.0
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: 7bit
Message-Id: <20261126-rwsem-dont-steal-from-queued-writer-v2-1-9772914de49e@kernel.org>
X-B4-Tracking: v=1; b=H4sIAAAAAAAA/5XNTQ6CMBBA4as0s2ZM2/ATWXkPwwLsFBqhxWkBD
 eHuRm7g9i3et0MkdhShFjswrS664KEWOhPwGFrfEzoDtQAtdamULJC3SBOa4BPGRO2IlsOEr4U
 WMrixS8Qo804pczW5LDvIBMxM1r1P5d5kAgYXU+DPia7qV//7rwoV6qogWUmb69LensSexkvgH
 prjOL7r0Zxg1wAAAA==
X-Change-ID: 20261105-rwsem-dont-steal-from-queued-writer-04b11d9d406b
To: Peter Zijlstra <peterz@infradead.org>, Ingo Molnar <mingo@redhat.com>, 
 Will Deacon <will@kernel.org>, Boqun Feng <boqun@kernel.org>, 
 Waiman Long <longman@redhat.com>, Nick Terrell <terrelln@fb.com>, 
 David Sterba <dsterba@suse.com>, Nathan Chancellor <nathan@kernel.org>, 
 Nick Desaulniers <ndesaulniers@google.com>, 
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>
Cc: linux-kernel@vger.kernel.org, 
 "David Hildenbrand (Arm)" <david@kernel.org>, llvm@lists.linux.dev, 
 ljs@kernel.org
X-Mailer: b4 0.14.3
X-Developer-Signature: v=1; a=openpgp-sha256; l=6619; i=ljs@kernel.org;
 h=from:subject:message-id; bh=OhTVphH9yPA2c+Lixk9fipSm8uBP8oqGlGaKZBQ0MAs=;
 b=owGbwMvMwCV2fu7ZrsZH9SKMp9WSGLI51off3uyfkNJyQH2qb/acsDM11xjbUx9t0ZSMPe2cc
 ufqqRNrO0pZGMS4GGTFFFmefxHfHyQSNq/zgr8bzBxWJpAhDFycAjCRKxsYGb7cKrV05WO3S3qY
 Y2n9M53H/CzPUcW/u27OO6bowJln8pvhfyqrjNkTQW+XN2dSvjTz2BpZbBB59cjlpc+1Q+mSRhb
 3OQA=
X-Developer-Key: i=ljs@kernel.org; a=openpgp;
 fpr=E7F417BF5214569E89D04F46CF9DCD8A81E27F14

Since commit 1a728dff855a ("locking/rwsem: Enable reader optimistic lock
stealing"), a racing read lock can steal an rwsem from under a queued
writer whose handoff timeout hasn't expired yet.

This is most problematic when an rwsem read lock is released then
reacquired in order to relieve lock contention, as instead it will simply
have the lock handed right back to it ahead of the intended beneficiary.

Naturally, this behaviour rather defeats the object of doing this kind of
thing, so this is less than ideal.

Fix this by updating the optimistic read lock stealing code in
rwsem_down_read_slowpath() to explicitly check whether the first queued
lock is a waiting writer and the rwsem was last held by a reader, and to
not allow the theft if so.

This still permits reader stealing if a writer last held the lock, as
failing to do so can starve readers in favour of writers. This maintains
fairness.

When a steal is disallowed, keep the existing sem->wait_lock held when
jumping to the queue code to avoid useless lock acquisition/release.

Also update the comment describing optimistic read lock acquisition
conditions to include this newly introduced behaviour.

Care is taken to ensure correct ordering of lock acquisition, lock waking
and marking the lock reader-owned.

Signed-off-by: Lorenzo Stoakes (ARM) <ljs@kernel.org>
---
Testing:

All on an AMD threadripper 9980X with 64 cores, one thread per core (SMT off),
bare metal testing.

Correctness
-----------
locktorture: RWSEM01-08 all pass, 30 minutes each, 0 read/write failures,
no splats.
Bare metal: no dmesg splats on any boot.

Writer latency (microbenchmark, bare metal, p99)
------------------------------------------------
readers          base      patched
2             3813 us        17 us
4             3868 us        29 us
16            5369 us      4008 us  (within expected stddev)
62            4612 us      3835 us  (ditto)
2, one CCD    3865 us        17 us
7, one CCD    3951 us        35 us

Writer throughput +35-54% at 2 and 4 readers and in both one-CCD cases.
Reader steals in this test: 4.8M -> 8.

stress-ng (bare metal, 64 instances, 2 boots each, alternating)
---------------------------------------------------------------
vma        59.9k -> 67.1k bogo-ops/s   +12.0%
msg                                     +9.5%
madvise                                 +5.0%

vma in guests: 64.2k-66.7k vs 58.8k-61.0k base.

will-it-scale (t=8 and t=64)
----------------------------
mmap1, mmap2, brk1, open1, page_fault1/2/3, unlink1: within noise.

Real workloads
--------------
                              base     patched
kernel build, LLVM (guest)    28.33 s  28.51 s   +0.6%
kernel build (bare metal)     26.86 s  27.03 s   +0.6%
relink with lld               6.136 s  6.154 s   +0.3%
zstd                          0.617 s  0.610 s   -1.1%
ripgrep                       0.154 s  0.153 s   flat
Go std build                  3.718 s  3.707 s   flat

I.e. all within noise levels.

v2:
* Update to allow reader stealing if a writer last held the lock to avoid a
  spinning writer from starving readers.
* Simplified the code.
* Ran a full suite of tests and benchmarks on bare metal to ensure
  correctness and avoid performance regressions.

v1:
https://lore.kernel.org/r/20261105-rwsem-dont-steal-from-queued-writer-v1-1-275e070f426f@kernel.org
---
 kernel/locking/rwsem.c | 44 +++++++++++++++++++++++++++-----------------
 1 file changed, 27 insertions(+), 17 deletions(-)

diff --git a/kernel/locking/rwsem.c b/kernel/locking/rwsem.c
index b9c180ac1eee..c49e518f1b2c 100644
--- a/kernel/locking/rwsem.c
+++ b/kernel/locking/rwsem.c
@@ -59,7 +59,9 @@
  * A fast path reader optimistic lock stealing is supported when the rwsem
  * is previously owned by a writer and the following conditions are met:
  *  - rwsem is not currently writer owned
- *  - the handoff isn't set.
+ *  - the handoff isn't set
+ *  - a writer isn't at the head of the wait queue while the rwsem was last
+ *    held by a reader.
  */
 #define RWSEM_READER_OWNED	(1UL << 0)
 #define RWSEM_NONSPINNABLE	(1UL << 1)
@@ -1018,47 +1020,55 @@ rwsem_down_read_slowpath(struct rw_semaphore *sem, long count, unsigned int stat
 {
 	long adjustment = -RWSEM_READER_BIAS;
 	long rcnt = (count >> RWSEM_READER_SHIFT);
+	bool reader_owned = atomic_long_read(&sem->owner) & RWSEM_READER_OWNED;
 	struct rwsem_waiter waiter, *first;
 	DEFINE_WAKE_Q(wake_q);
 
-	/*
-	 * To prevent a constant stream of readers from starving a sleeping
-	 * writer, don't attempt optimistic lock stealing if the lock is
-	 * very likely owned by readers.
-	 */
-	if ((atomic_long_read(&sem->owner) & RWSEM_READER_OWNED) &&
-	    (rcnt > 1) && !(count & RWSEM_WRITER_LOCKED))
-		goto queue;
-
 	/*
 	 * Reader optimistic lock stealing.
 	 */
 	if (!(count & (RWSEM_WRITER_LOCKED | RWSEM_FLAG_HANDOFF))) {
-		rwsem_set_reader_owned(sem);
-		lockevent_inc(rwsem_rlock_steal);
-
 		/*
-		 * Wake up other readers in the wait queue if it is
-		 * the first reader.
+		 * To prevent a constant stream of readers from starving a
+		 * sleeping writer, don't attempt optimistic lock stealing if
+		 * the lock is very likely owned by readers.
 		 */
+		if (reader_owned && rcnt > 1)
+			goto queue;
+
 		if ((rcnt == 1) && (count & RWSEM_FLAG_WAITERS)) {
 			raw_spin_lock_irq(&sem->wait_lock);
-			if (sem->first_waiter)
+			first = sem->first_waiter;
+			/*
+			 * If a reader last held this lock, let a queued writer
+			 * take precedence to avoid writer starvation.
+			 */
+			if (reader_owned && first &&
+			    first->type == RWSEM_WAITING_FOR_WRITE)
+				goto queue_locked;
+			rwsem_set_reader_owned(sem);
+			/* If first reader, wake other readers in queue. */
+			if (first)
 				rwsem_mark_wake(sem, RWSEM_WAKE_READ_OWNED,
 						&wake_q);
 			raw_spin_unlock_irq(&sem->wait_lock);
 			wake_up_q(&wake_q);
+		} else {
+			rwsem_set_reader_owned(sem);
 		}
+
+		lockevent_inc(rwsem_rlock_steal);
 		return sem;
 	}
 
 queue:
+	raw_spin_lock_irq(&sem->wait_lock);
+queue_locked:
 	waiter.task = current;
 	waiter.type = RWSEM_WAITING_FOR_READ;
 	waiter.timeout = jiffies + RWSEM_WAIT_TIMEOUT;
 	waiter.handoff_set = false;
 
-	raw_spin_lock_irq(&sem->wait_lock);
 	first = sem->first_waiter;
 	if (!first) {
 		/*

---
base-commit: 05441d697f7f9a927264f4058cbbc6a03dfcac9d
change-id: 20261105-rwsem-dont-steal-from-queued-writer-04b11d9d406b

Cheers,
-- 
Lorenzo Stoakes (ARM) <ljs@kernel.org>

