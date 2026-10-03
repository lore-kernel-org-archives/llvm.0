Received: from smtp.kernel.org (aws-us-west-2-korg-mail-alma10-1.taild15c8.ts.net [100.103.45.18])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0A77E429CEE;
	Sat,  3 Oct 2026 12:13:04 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=100.103.45.18
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1791029594; cv=none; b=jzVflaKFq9W/gZhZOa9dvDFqSmLVKPaQKU8NuBYnuFcve80Hlk2pXrjNnlzSTTAxSCqBK32VljA+FBfCTXtD+99eC0z5y4xMC/4nUxrtwlQ1SfhDhug0eo8xuS4zlwjv83IwRtLEY3mNqYb6HwTIafWsuSH5Wld3FCH2bfsf0ns=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1791029594; c=relaxed/simple;
	bh=06RFvegxE7PoJyubYVTdk/iRW5+HYfI8aYJAdBY6Grg=;
	h=From:To:Cc:Subject:Date:Message-ID:MIME-Version; b=HkOSTtwHVLqLc/qu6QPet4BkdyN4OcbkYVjlpBTeBGASN1DIYt+JYDVCRtW2B/RVyvqE6iJF2WGSRMPGuyQjcUzwW9N5feCN4oNMiW/EIy5TAB4Q7RRg0YhWxhVwUr/hUC9m/YgfFUjDDIBDeapn9YyET0Ukzcldfd2azjWF5eM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b=QZKtuU8m; arc=none smtp.client-ip=100.103.45.18
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=kernel.org header.i=@kernel.org header.b="QZKtuU8m"
Received: by smtp.kernel.org (Postfix) with ESMTPSA id EC7121F0089B;
	Sat,  3 Oct 2026 12:12:59 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=kernel.org;
	s=k20260515; t=1791029581;
	bh=wzHVXOlpL8P0KxdHBzTscGH9M3Bx5tZKzJ9lOMnN8No=;
	h=From:To:Cc:Subject:Date;
	b=QZKtuU8mfq+l1E9m3whBms9hSug5FdrJ9dJadN10rUo6B969r14OuEgmLr+/cbwVm
	 BwgvFpAZiXOZUAwtNiOJVesqLerg9ruphzOXEBIE4hAgLGh+XMWHwBomXjaf6IPtzv
	 z5zGViC81FGe3tMhXaFowIMSQF39n8gY49t0dUxF8ktTxP98LO1T/air9XPb+9bFQJ
	 8pduGKip+tPQ9/t+5v+aB02kgKNn7mQV0YVrae94Nt+SX6DBdVVJ+KSEVDQEsnvNQn
	 h/39yZur/M6+2KQX/HvNQTl32Oa2t9cXVa5xNryYh835IRenuQos7QfWPC2sCRWHnr
	 /Z1UGygZaliWQ==
From: Sasha Levin <sashal@kernel.org>
To: James Morse <james.morse@arm.com>,
	Ben Horgan <ben.horgan@arm.com>,
	Nathan Chancellor <nathan@kernel.org>,
	Jonathan Cameron <jonathan.cameron@oss.qualcomm.com>,
	Andre Przywara <andre.przywara@arm.com>,
	Gavin Shan <gshan@redhat.com>
Cc: Sasha Levin <sashal@kernel.org>,
	"kernelci.org bot" <bot@kernelci.org>,
	Reinette Chatre <reinette.chatre@intel.com>,
	Fenghua Yu <fenghuay@nvidia.com>,
	Nick Desaulniers <ndesaulniers@google.com>,
	Bill Wendling <morbo@google.com>,
	Justin Stitt <justinstitt@google.com>,
	linux-arm-kernel@lists.infradead.org,
	linux-kernel@vger.kernel.org,
	llvm@lists.linux.dev
Subject: [PATCH] arm_mpam: make the mon_sel guard conditional only
Date: Sat,  3 Oct 2026 08:12:48 -0400
Message-ID: <20261003121251.3942666-1-sashal@kernel.org>
X-Mailer: git-send-email 2.53.0
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
 drivers/resctrl/mpam_internal.h | 7 ++++---
 1 file changed, 4 insertions(+), 3 deletions(-)

diff --git a/drivers/resctrl/mpam_internal.h b/drivers/resctrl/mpam_internal.h
index ee7c3953a9b6c..be1795b29aca2 100644
--- a/drivers/resctrl/mpam_internal.h
+++ b/drivers/resctrl/mpam_internal.h
@@ -203,9 +203,10 @@ static inline int mpam_mon_sel_lock_init(struct device *dev,
 	return devm_mutex_init(dev, &msc->mon_sel_mutex);
 }
 
-DEFINE_GUARD(mon_sel, struct mpam_msc *,
-	     mpam_mon_sel_lock(_T), mpam_mon_sel_unlock(_T));
-DEFINE_GUARD_COND(mon_sel, _lock, mpam_mon_sel_lock(_T), _RET);
+DEFINE_CLASS(mon_sel_lock, struct mpam_msc *,
+	     _T ? mpam_mon_sel_unlock(_T) : (void)0,
+	     mpam_mon_sel_lock(msc) ? msc : NULL, struct mpam_msc *msc);
+DEFINE_CLASS_IS_COND_GUARD(mon_sel_lock);
 
 /* Bits for mpam features bitmaps */
 enum mpam_device_features {
-- 
2.53.0

