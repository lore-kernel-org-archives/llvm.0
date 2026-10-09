Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id E00554EFFBB;
	Fri,  9 Oct 2026 16:32:41 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791563567; cv=none; b=uRH8/k13GlSGsKvY4BW86xJFzInxjcs7SE3VU88d/Ipz9G2WAjiK5x15yVqEG3RVVh6PHbDlbEMyromCc6X95M/KV0mD9W3irj4CaoAHbqcJMgfC1wD+6Kr+ScNot6o/FN7s72i8wnn0vSgp1dGYMXQ3lvFSOCJkcqmbYfNTKYg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791563567; c=relaxed/simple;
	bh=mws7jpAgCcmHzyfVSY20/vYOYikF9/+iGzSgCB/KISc=;
	h=From:To:Cc:Subject:Date:Message-ID:In-Reply-To:References:
	 MIME-Version; b=MoeI80IJP01GrW0TWwiG0Qw9Szlh2YoBJHFeFRLpKriaMBBtNwLAXo1M2vmmSitX4NIoCw/pHCf0GYnELWJs43uiiNE+7vAZofTiuvlkKb6GFIrVPFskd5RBI1eRAYNcayIUDAB6uCAADZZbfeAOvT5fWihLb2iFHfJwb9jjIvM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=a3m9XDKv; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="a3m9XDKv"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 4318B1F00893;
	Fri,  9 Oct 2026 16:32:37 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791563561;
	bh=v8UB6+jjpF31hb+q4x1Zq5hI5lb352r6B0Ghit+olxY=;
	h=From:To:Cc:Subject:Date:In-Reply-To:References;
	b=a3m9XDKv8NyKyGJwhSs5E1Y7xeGJ8giPb8g2D37BVYZQe+v/FHxL+NB9OXxSegkcN
	 ikFwO5EaQP2Sq3LAXZeqnRB71inx5yQvqqx2luLo6kicVIhwu8NzoWSWdZMmAn5m7W
	 EuLEkdyyecO6Wm61UyTYtg8U7Kh8WjhUX2fewdhubhHWklOuAtLLZ9OcGGxIRqo92I
	 an0oP5xsjH3lDXY6WYJOrjyJ3h2uy5pYRmSY9iYuTqSURqjBt2UL0rNPrgJKv6ow08
	 aoPftfKd86VW+7hjTQAb1wmpBKLkg2xZQArWTlpFkNSKhrKJ1cmAncOQE7ilLp8ess
	 KADbSLx/KQkiA==
From: Sasha Levin <sashal@kernel.org>
To: ben.horgan@arm.com
Cc: andre.przywara@arm.com,
	bot@kernelci.org,
	fenghuay@nvidia.com,
	gshan@redhat.com,
	james.morse@arm.com,
	jonathan.cameron@oss.qualcomm.com,
	justinstitt@google.com,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev,
	morbo@google.com,
	nathan@kernel.org,
	ndesaulniers@google.com,
	reinette.chatre@intel.com,
	Sasha Levin <sashal@kernel.org>
Subject: [PATCH v2] arm_mpam: make the mon_sel guard conditional only
Date: Fri,  9 Oct 2026 12:32:35 -0400
Message-ID: <20261009163235.3-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
In-Reply-To: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
References: <7490d5e6-ac9b-4f23-b58d-60eec2882e60@arm.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Transfer-Encoding: 8bit

Building arm64 allmodconfig with clang fails:

  drivers/resctrl/mpam_internal.h:207:7: error: ignoring return value
  of function declared with 'warn_unused_result' attribute
  [-Werror,-Wunused-result]
    207 |              mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));

mpam_mon_sel_lock() is __must_check and can fail: for an MSC accessed
through the MPAM-Fb firmware interface it returns false when called
from a context that cannot sleep. The mon_sel guard was defined with
DEFINE_GUARD(), which calls it unconditionally and discards the
result, so a guard(mon_sel) user would carry on without the lock and
release it on scope exit. The unconditional guard only exists as the
base for the conditional mon_sel_lock variant, which is the one
actually used.

Define mon_sel_lock directly as a conditional guard class instead, as
posix-timers does for lock_timer: the constructor returns NULL when
the lock cannot be taken, and the destructor only releases a lock
that was taken. ACQUIRE(mon_sel_lock, ...) works as before, including
ACQUIRE_ERR() returning -EBUSY on failure, and there is no
unconditional variant left to misuse.

Reported-by: kernelci.org bot <bot@kernelci.org>
Closes: https://d.kernelci.org/i/maestro:66f869ecbbb5b8592562ffd89f049c5ddf682547
Closes: https://d.kernelci.org/i/maestro:647269216758644837afcaac8e67d8dbe713a0e2
Fixes: 0db1715e4c9c ("arm_mpam: propagate MSC access errors for hw_probe functions")
Assisted-by: LLM
Signed-off-by: Sasha Levin <sashal@kernel.org>
---
Changes in v2:
- Use an if statement in the destructor, as suggested by Ben Horgan.

 drivers/resctrl/mpam_internal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index ee7c3953a9b6c..1f86cc158100b 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
 	return devm_mutex_init(dev, &msc->mon_sel_mutex);
 }
 
-DEFINE_GUARD(mon_sel, struct mpam_msc *,
-	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
-DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
+DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
+	     if (_T) mpam_mon_sel_unlock(_T),
+	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
+DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
 
 /* Bits for mpam features bitmaps */
 enum mpam_device_features {
-- 
2.53.0

