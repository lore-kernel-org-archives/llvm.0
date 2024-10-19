Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 79F59185B5F
	for <llvm@lists.linux.dev>; Sat, 19 Oct 2024 06:19:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1729318786; cv=none; b=YYj8GVqhy5gBGHp26GSx5ZRCEPwsw88jbBGNyu2XUrXKEdMBFDJeaGIJ4IbpHpAJr2+RmBDtZ+1zQsbsAvr8k5ebKIboC07+nxU/iNKAGvey8Z5jtbjqOw/q1m21xopHBgHaJ1rFfqaoVEv1xgWxcuSjMqqCOkdaViIK+dFAdLw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1729318786; c=relaxed/simple;
	bh=kqc1IZzjYnTyZ/I2YQiVnanSFIHUEPYNgToDtn/QhCA=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=P9WPHFP+YqUwSjCZxPHU86HceHTKCzI23U1ILI4k2aaQTn68NkGlyY9JXY/W59Sr3BKXxCsVK/Qqq0vCH8kjyG1PlVixliXbqg+Daphx8rP0de3KyZy8VS/1H3xQ5RbiDmtc6/o+3ry/IDUikDRFPVI+BXCqtvsoC3bwREV8zDk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app1 (Coremail) with SMTP id HgEQrABXm6RkTxNnDAYdCA--.42252S2;
	Sat, 19 Oct 2024 14:19:16 +0800 (CST)
Received: from [10.12.173.122] (unknown [10.12.173.122])
	by gateway (Coremail) with SMTP id _____wBnPsViTxNnZmNdAA--.22033S2;
	Sat, 19 Oct 2024 14:19:15 +0800 (CST)
Message-ID: <8a882bc0-7125-4036-b939-fbd9e821c041@hust.edu.cn>
Date: Sat, 19 Oct 2024 14:19:14 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH 0/2] Add the translation of documents in kbuild
To: si.yanteng@linux.dev, Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <ndesaulniers@google.com>, Bill Wendling
 <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 Jonathan Corbet <corbet@lwn.net>, Alex Shi <alexs@kernel.org>
Cc: hust-os-kernel-patches@googlegroups.com, llvm@lists.linux.dev
References: <cover.1729259177.git.dzm91@hust.edu.cn>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <cover.1729259177.git.dzm91@hust.edu.cn>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 8bit
X-CM-TRANSID:HgEQrABXm6RkTxNnDAYdCA--.42252S2
Authentication-Results: app1; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvdXoW7Gw48uFWkWryxXw4xAry7Jrb_yoWDCrbEyr
	1vqayxA3WDZFnrJF4kur4fAry8uan5Kr10yFn0yrZIy39xWr4DJw1qqrna9FWvgF4akryf
	Ww1vq34Sqr17CjkaLaAFLSUrUUUU8b8apTn2vfkv8UJUUUU8Yxn0WfASr-VFAUDa7-sFnT
	9fnUUIcSsGvfJTRUUUbPkYjsxI4VW5JwAYFVCjjxCrM7CY07I20VC2zVCF04k26cxKx2IY
	s7xG6rWj6s0DM28lY4IEw2IIxxk0rwA2F7IY1VAKz4vEj48ve4kI8wA2z4x0Y4vE2Ix0cI
	8IcVAFwI0_Xr0_Ar1l84ACjcxK6xIIjxv20xvEc7CjxVAFwI0_Cr0_Gr1UM28EF7xvwVC2
	z280aVAFwI0_GcCE3s1l84ACjcxK6I8E87Iv6xkF7I0E14v26rxl6s0DM2kKe7AKxVWUXV
	WUAwAac4AC62xK8xCEY4vEwIxC4wAS0I0E0xvYzxvE52x082IY62kv0487Mc804VCY07AI
	YIkI8VC2zVCFFI0UMc02F40EFcxC0VAKzVAqx4xG6I80ewAv7VACjcxG62k0Y48FwI0_Gr
	1j6F4UJwAv7VCjz48v1sIEY20_GFW3Jr1UJwAv7VCY1x0262k0Y48FwI0_Gr1j6F4UJwAm
	72CE4IkC6x0Yz7v_Jr0_Gr1lF7xvr2IY64vIr41lc7CjxVAaw2AFwI0_JF0_Jw1l42xK82
	IYc2Ij64vIr41l42xK82IY6x8ErcxFaVAv8VW8uFyUJr1UMxC20s026xCaFVCjc4AY6r1j
	6r4UMxCIbckI1I0E14v26r1Y6r17MI8I3I0E5I8CrVAFwI0_Jr0_Jr4lx2IqxVCjr7xvwV
	AFwI0_JrI_JrWlx4CE17CEb7AF67AKxVWUtVW8ZwCIc40Y0x0EwIxGrwCI42IY6xIIjxv2
	0xvE14v26r1j6r1xMIIF0xvE2Ix0cI8IcVCY1x0267AKxVWUJVW8JwCI42IY6xAIw20EY4
	v20xvaj40_Jr0_JF4lIxAIcVC2z280aVAFwI0_Jr0_Gr1lIxAIcVC2z280aVCY1x0267AK
	xVWUJVW8JbIYCTnIWIevJa73UjIFyTuYvjxUUD73UUUUU
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

+to Jon and Alex.

It seems that tocmd and cccmd does not work with cover letter. Any 
suggestions?

     tocmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats --nol"
     cccmd ="`pwd`/scripts/get_maintainer.pl --nogit --norolestats --nom"

Dongliang Mu

On 2024/10/18 21:47, Dongliang Mu wrote:
> Since llvm refers to reproducible-builds.html, so I create this patchset
> and add the translation of these two documents
>
> Dongliang Mu (2):
>    docs/zh_CN: add the translation of kbuild/kbuild.rst
>    docs/zh_CN: add the translations of kbuild/reproducible-builds.rst
>
>   .../translations/zh_CN/kbuild/index.rst       |   4 +-
>   .../translations/zh_CN/kbuild/kbuild.rst      | 304 ++++++++++++++++++
>   .../zh_CN/kbuild/reproducible-builds.rst      | 114 +++++++
>   3 files changed, 420 insertions(+), 2 deletions(-)
>   create mode 100644 Documentation/translations/zh_CN/kbuild/kbuild.rst
>   create mode 100644 Documentation/translations/zh_CN/kbuild/reproducible-builds.rst
>

