Received: from linux.microsoft.com (linux.microsoft.com [13.77.154.182])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 3D3D335956;
	Mon,  9 Dec 2024 16:52:27 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=13.77.154.182
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1733763148; cv=none; b=XENEqYO7iUbeU/QxN3bstTcYITTqcZh7gTzKeGjt/uBG++jnYskNB5NvKQkqqaAWjMZLiVxMTsJL0zx0jW64e+WCMLOjMI1IPY8jPQt5vlrs0+CKk2fm784VPGGs8ARxNipbtFr+WA91vdv8RK9qfV9tAeJHw83uJC8aBvnCSps=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1733763148; c=relaxed/simple;
	bh=ws5mpQwJTvAmLytNzqXNHO18X3UPhMnnR1gKM8NITG8=;
	h=Message-ID:Date:MIME-Version:Cc:Subject:To:References:From:
	 In-Reply-To:Content-Type; b=eMIisCzUwyPuUIpLnYGchw7TB4xoOKWhMePIqsB2HgEWWBRMJhjherfQONXiLYwGqxL3+VnOLzYbuItgOHHl6i3oRTiIvKPZ+zw2j1ucI3oFrKBOCQwDUlqgRoQtxWiVhDsmMJtwMvFR3I2TP6BQh3HpzvkKUVtlRgJ7qTde8KM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com; spf=pass smtp.mailfrom=linux.microsoft.com; dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b=qBjs6kg4; arc=none smtp.client-ip=13.77.154.182
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=linux.microsoft.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=linux.microsoft.com header.i=@linux.microsoft.com header.b="qBjs6kg4"
Received: from [100.65.161.4] (unknown [20.236.11.102])
	by linux.microsoft.com (Postfix) with ESMTPSA id 6E78320ACD6A;
	Mon,  9 Dec 2024 08:52:26 -0800 (PST)
DKIM-Filter: OpenDKIM Filter v2.11.0 linux.microsoft.com 6E78320ACD6A
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=linux.microsoft.com;
	s=default; t=1733763146;
	bh=FnCOltGIwrDp2+r7cZvmO4iBZNK0F5pOt5QUm+txeAM=;
	h=Date:Cc:Subject:To:References:From:In-Reply-To:From;
	b=qBjs6kg4HHrk8JiNn9yRiMmN/rsar07KVmuEMNeum34ztzXR6ZDARgbJNADBdWw4B
	 iLv8P9Uq6V/us+mYaooBlN29Pw9mk2G4NMaYd8MA7F+38t27LqOlUWW1me0RxJcH2h
	 0LfdftQclw1DZ7xZ2qEBSmgZYHYHnNkzakhTV5T8=
Message-ID: <fba68cce-2445-4a1d-a609-b6308a62c1b3@linux.microsoft.com>
Date: Mon, 9 Dec 2024 08:52:27 -0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Cc: eahariha@linux.microsoft.com, llvm@lists.linux.dev,
 oe-kbuild-all@lists.linux.dev, Michael Kelley <mhklinux@outlook.com>,
 kernel test robot <lkp@intel.com>
Subject: Re: [hyperv:hyperv-fixes 5/11] drivers/hv/vmbus_drv.c:2510:45: error:
 call to undeclared function 'secs_to_jiffies'; ISO C99 and later do not
 support implicit function declarations
To: Wei Liu <wei.liu@kernel.org>
References: <202412091658.m9g4L9gw-lkp@intel.com>
From: Easwar Hariharan <eahariha@linux.microsoft.com>
Content-Language: en-US
In-Reply-To: <202412091658.m9g4L9gw-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 12/8/2024 9:50 PM, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/hyperv/linux.git hyperv-fixes
> head:   b8ea8cd0fbd358feee3e9172c5ef8afd671e0d11
> commit: eced6df67f6b76889e80ded109a73ca5fac1e5cd [5/11] drivers: hv: Convert open-coded timeouts to secs_to_jiffies()
> config: i386-buildonly-randconfig-004-20241209 (https://download.01.org/0day-ci/archive/20241209/202412091658.m9g4L9gw-lkp@intel.com/config)
> compiler: clang version 19.1.3 (https://github.com/llvm/llvm-project ab51eccf88f5321e7c60591c5546b254b6afab99)
> reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20241209/202412091658.m9g4L9gw-lkp@intel.com/reproduce)
> 

Hi Wei,

It appears hyperv-fixes needs to be rebased on 6.13-rc1 to provide
secs_to_jiffies() from commit b35108a51cf7bab58d7eace1267d7965978bcdb8
(jiffies: Define secs_to_jiffies()). I suppose you'll do that before
sending the PR to Linus.

Thanks,
Easwar
