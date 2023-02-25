Received: from gnuweeb.org (gnuweeb.org [51.81.211.47])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id A7CC1210D;
	Sat, 25 Feb 2023 08:27:53 +0000 (UTC)
Received: from biznet-home.integral.gnuweeb.org (unknown [182.253.183.169])
	by gnuweeb.org (Postfix) with ESMTPSA id DC1958312D;
	Sat, 25 Feb 2023 08:27:44 +0000 (UTC)
X-GW-Data: lPqxHiMPbJw1wb7CM9QUryAGzr0yq5atzVDdxTR0iA==
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple; d=gnuweeb.org;
	s=default; t=1677313666;
	bh=b3cZpQdUYtD/r0SSm8xEnB9mBj7D0hdUK34PdKAk3YQ=;
	h=Date:From:To:Cc:Subject:References:In-Reply-To:From;
	b=ox6G1JiF1O0FP1STDalE4z1JNdKVadOsqhu/GSaMX0LzNXJq0HV9QZF2G8m87P3f7
	 AWkNPxxIe3wW2cGAetQGOAm/iVlbvAL4f0O9TR87JvQmDfJNikoND8PpIkhr4O3JMI
	 8gIoyroIPOH6fFuG33RaVg1IjBQWsrx6sdSGQrBEFuxFwVQ3SlqDJUEhXpqKgL74et
	 MlkeljyolZB40PRGR1OOdTXEQ7MLtEXm0mHg6Pqux/cyMOZRMbD/kmXSs+AO49w5wS
	 KYaZpJa2j5kErMacGZ+UmqIaE/LTJ8r2Wl6o0V6HerZ4qCQHNEY/9AK50Kx1c5IHy6
	 n5b1su7wnpEyw==
Date: Sat, 25 Feb 2023 15:27:40 +0700
From: Ammar Faizi <ammarfaizi2@gnuweeb.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev,
	GNU/Weeb Mailing List <gwml@vger.gnuweeb.org>
Subject: Re: [ammarfaizi2-block:af/dev.btrfs 10/11] fs/btrfs/super.c:352:19:
 error: array type 'cpumask_var_t' (aka 'struct cpumask[1]') is not
 assignable
Message-ID: <Y/nGfGZEua3AE6h6@biznet-home.integral.gnuweeb.org>
References: <202302251526.XdMJnuk0-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202302251526.XdMJnuk0-lkp@intel.com>
X-Bpl: hUx9VaHkTWcLO7S8CQCslj6OzqBx2hfLChRz45nPESx5VSB/xuJQVOKOB1zSXE3yc9ntP27bV1M1

On Sat, Feb 25, 2023 at 03:23:48PM +0800, kernel test robot wrote: 
> >> fs/btrfs/super.c:352:19: error: array type 'cpumask_var_t' (aka 'struct cpumask[1]') is not assignable
>            info->wq_cpu_set = mask;
>            ~~~~~~~~~~~~~~~~ ^
>    1 error generated.

Oh, it is because cpumask_var_t is defined as a different type,
depending on CONFIG_CPUMASK_OFFSTACK.

When CONFIG_CPUMASK_OFFSTACK=y

   typedef struct cpumask *cpumask_var_t;

When CONFIG_CPUMASK_OFFSTACK is not set:

   typedef struct cpumask cpumask_var_t[1];

Let's avoid that temporary variable. The fix below...

---
diff --git a/fs/btrfs/super.c b/fs/btrfs/super.c
index 47b9e38d6a6313a1..f2e064ba0534a39c 100644
--- a/fs/btrfs/super.c
+++ b/fs/btrfs/super.c
@@ -323,7 +323,6 @@ static void wq_cpu_set_fix_cpulist(char *set)
 
 static int parse_wq_cpu_set(struct btrfs_fs_info *info, const char *set)
 {
-	cpumask_var_t mask;
 	char *set_copy;
 	int ret;
 
@@ -331,31 +330,30 @@ static int parse_wq_cpu_set(struct btrfs_fs_info *info, const char *set)
 	if (!set_copy)
 		return -ENOMEM;
 
-	if (!alloc_cpumask_var(&mask, GFP_KERNEL)) {
+	if (!alloc_cpumask_var(&info->wq_cpu_set, GFP_KERNEL)) {
 		ret = -ENOMEM;
 		goto out_fail;
 	}
 
 	wq_cpu_set_fix_cpulist(set_copy);
-	ret = cpulist_parse(set_copy, mask);
+	ret = cpulist_parse(set_copy, info->wq_cpu_set);
 	if (ret) {
 		btrfs_err(info, "failed to parse wq_cpu_set: %d", ret);
 		goto out_fail_cpu;
 	}
 
-	if (cpumask_empty(mask)) {
+	if (cpumask_empty(info->wq_cpu_set)) {
 		ret = -EINVAL;
 		btrfs_err(info, "wq_cpu_set cannot be empty");
 		goto out_fail_cpu;
 	}
 
-	info->wq_cpu_set = mask;
 	info->wq_cpu_set_str = set_copy;
 	btrfs_set_and_info(info, WQ_CPU_SET, "using wq_cpu_set=%s", set_copy);
 	return 0;
 
 out_fail_cpu:
-	free_cpumask_var(mask);
+	free_cpumask_var(info->wq_cpu_set);
 out_fail:
 	kfree(set_copy);
 	return ret;


-- 
Ammar Faizi

