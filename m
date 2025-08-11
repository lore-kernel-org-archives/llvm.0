Received: from zg8tmtyylji0my4xnjeumjiw.icoremail.net (zg8tmtyylji0my4xnjeumjiw.icoremail.net [162.243.161.220])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id E88CA2AEE4
	for <llvm@lists.linux.dev>; Mon, 11 Aug 2025 06:16:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=162.243.161.220
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1754892973; cv=none; b=uYUjGkv/CiejAa4yOcN+RWJ06VTWa6epg3obAsAnjuPgIXzYvNUB8gPJbUKpusnI2SUD6hY71maJos4JbsL/prkp0b79cyRpataKf0rB3XCDSfHFUwbgMC1GHfV2/RUsgkJurfSo22uG0W8mHcX98E+Nt8ylxC57oTWdGW0TTwU=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1754892973; c=relaxed/simple;
	bh=8yBfRNNj88KYOLzIVbc8KOtL/WKAmqp/cxB42b4ZV6I=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=KY7QILWZQaSgZY87NNxzAF7vylj4RPMt90jIq2VB0j4oiN7InKYNYEJuTofAer949sY9H24ytcZoqm6ZPxaNRZYkDdEAgv9Ci0pMis3xR5Izh+9EBGO2fX2oieZpbHh4CV+pWXkSFrDQOYdDm7u8Hz/MMSFMgS7K9BEYcvTwf2A=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn; spf=pass smtp.mailfrom=hust.edu.cn; arc=none smtp.client-ip=162.243.161.220
Authentication-Results: smtp.subspace.kernel.org; dmarc=none (p=none dis=none) header.from=hust.edu.cn
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=hust.edu.cn
Received: from hust.edu.cn (unknown [172.16.0.52])
	by app2 (Coremail) with SMTP id HwEQrACnD2dqiploUpgkAA--.35047S2;
	Mon, 11 Aug 2025 14:15:06 +0800 (CST)
Received: from [192.168.101.253] (unknown [183.94.132.22])
	by gateway (Coremail) with SMTP id _____wC3T1Nliplop6jPAQ--.37082S2;
	Mon, 11 Aug 2025 14:15:03 +0800 (CST)
Message-ID: <226d6f90-f80b-430d-a30c-db5a2a652e3b@hust.edu.cn>
Date: Mon, 11 Aug 2025 14:15:01 +0800
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: [PATCH] scripts/checktransupdate.py: add support for scanning
 directory
To: Haoyang LIU <tttturtleruss@gmail.com>,
 Nathan Chancellor <nathan@kernel.org>,
 Nick Desaulniers <nick.desaulniers+lkml@gmail.com>,
 Bill Wendling <morbo@google.com>, Justin Stitt <justinstitt@google.com>,
 dzm91@hust.edu.cn, Yanteng Si <si.yanteng@linux.dev>,
 Alex Shi <alexs@kernel.org>, Jonathan Corbet <corbet@lwn.net>
Cc: hust-os-kernel-patches@googlegroups.com, linux-kernel@vger.kernel.org,
 llvm@lists.linux.dev, "open list:DOCUMENTATION" <linux-doc@vger.kernel.org>
References: <20250810161730.6530-1-tttturtleruss@gmail.com>
From: Dongliang Mu <dzm91@hust.edu.cn>
In-Reply-To: <20250810161730.6530-1-tttturtleruss@gmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit
X-CM-TRANSID:HwEQrACnD2dqiploUpgkAA--.35047S2
Authentication-Results: app2; spf=neutral smtp.mail=dzm91@hust.edu.cn;
X-Coremail-Antispam: 1UD129KBjvJXoWxXw4rJrWDGr1rAFWDZFW3Awb_yoW5ZrWrpa
	y5K3WfJa47Jw13Gw1fGr48urWfGF97J3yYqr1Iqwn5tr4DKw4SgF43tFyY9FWxJryfXFWU
	XF4FkryjkryDua7anT9S1TB71UUUUj7qnTZGkaVYY2UrUUUUjbIjqfuFe4nvWSU5nxnvy2
	9KBjDU0xBIdaVrnRJUUUQYb7Iv0xC_Zr1lb4IE77IF4wAFc2x0x2IEx4CE42xK8VAvwI8I
	cIk0rVWrJVCq3wA2ocxC64kIII0Yj41l84x0c7CEw4AK67xGY2AK021l84ACjcxK6xIIjx
	v20xvE14v26F1j6w1UM28EF7xvwVC0I7IYx2IY6xkF7I0E14v26F4j6r4UJwA2z4x0Y4vE
	x4A2jsIE14v26rxl6s0DM28EF7xvwVC2z280aVCY1x0267AKxVW0oVCq3wAaw2AFwI0_JF
	0_Jw1lnxkEFVAIw20F6cxK64vIFxWle2I262IYc4CY6c8Ij28IcVAaY2xG8wAqjxCEc2xF
	0cIa020Ex4CE44I27wAqx4xG64xvF2IEw4CE5I8CrVC2j2WlYx0EF7xvrVAajcxG14v26r
	4UJVWxJr1lYx0E74AGY7Cv6cx26r4fZr1UJr1lYx0Ec7CjxVAajcxG14v26r4UJVWxJr1l
	Ox8S6xCaFVCjc4AY6r1j6r4UM4x0Y48IcVAKI48JMxkF7I0En4kS14v26r126r1DMxAIw2
	8IcxkI7VAKI48JMxAIw28IcVCjz48v1sIEY20_GFW3Jr1UJwCFx2IqxVCFs4IE7xkEbVWU
	JVW8JwCFI7km07C267AKxVWUAVWUtwC20s026c02F40E14v26r1j6r18MI8I3I0E7480Y4
	vE14v26r106r1rMI8E67AF67kF1VAFwI0_Jw0_GFylIxkGc2Ij64vIr41lIxAIcVC0I7IY
	x2IY67AKxVWUCVW8JwCI42IY6xIIjxv20xvEc7CjxVAFwI0_Jr0_Gr1lIxAIcVCF04k26c
	xKx2IYs7xG6r1j6r1xMIIF0xvEx4A2jsIE14v26r1j6r4UMIIF0xvEx4A2jsIEc7CjxVAF
	wI0_Jr0_GrUvcSsGvfC2KfnxnUUI43ZEXa7IUnb4S5UUUUU==
X-CM-SenderInfo: asqsiiirqrkko6kx23oohg3hdfq/

+to Yanteng, Dongliang, Alex and Jon

+cc linux-doc mailing list

On 8/11/25 12:17 AM, Haoyang LIU wrote:
> Origin script can only accept a file as parameter, this commit enables
> it to scan a directory.
>
> Usage example:
> ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
>
> Signed-off-by: Haoyang LIU <tttturtleruss@gmail.com>
> ---
>   scripts/checktransupdate.py | 26 +++++++++++++++++++++++++-
>   1 file changed, 25 insertions(+), 1 deletion(-)
>
> diff --git a/scripts/checktransupdate.py b/scripts/checktransupdate.py
> index e39529e46c3d..0d197d036650 100755
> --- a/scripts/checktransupdate.py
> +++ b/scripts/checktransupdate.py
> @@ -13,6 +13,8 @@ The usage is as follows:
>   This will print all the files that need to be updated or translated in the zh_CN locale.
>   - ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>   This will only print the status of the specified file.
> +- ./scripts/checktransupdate.py Documentation/translations/zh_CN/dev-tools
> +This will print all the files in the specified folder and its subfolders.
>   
>   The output is something like:
>   Documentation/dev-tools/kfence.rst
> @@ -21,6 +23,17 @@ No translation in the locale of zh_CN
>   Documentation/translations/zh_CN/dev-tools/testing-overview.rst
>   commit 42fb9cfd5b18 ("Documentation: dev-tools: Add link to RV docs")
>   1 commits needs resolving in total
> +
> +Documentation/translations/zh_CN/dev-tools/index.rst
> +commit d5af79c05e93 ("Documentation: move dev-tools debugging files to process/debugging/")
> +commit d5dc95836147 ("kbuild: Add Propeller configuration for kernel build")
> +commit 315ad8780a12 ("kbuild: Add AutoFDO support for Clang build")
> +3 commits needs resolving in total
> +
> +Documentation/translations/zh_CN/dev-tools/kcsan.rst
> +commit b37221cc861d ("Documentation: kcsan: fix "Plain Accesses and Data Races" URL in kcsan.rst")
> +commit 72ffee678f6f ("docs: update dev-tools/kcsan.rst url about KTSAN")
> +2 commits needs resolving in total
>   """
>   
>   import os
> @@ -131,7 +144,7 @@ def check_per_file(file_path):
>       opath = get_origin_path(file_path)
>   
>       if not os.path.isfile(opath):
> -        logging.error("Cannot find the origin path for {file_path}")
> +        logging.error(f"Cannot find the origin path for {file_path}")
>           return
>   
>       o_from_head = get_latest_commit_from(opath, "HEAD")
> @@ -293,6 +306,17 @@ def main():
>                   if args.print_missing_translations:
>                       logging.info(os.path.relpath(os.path.abspath(file), linux_path))
>                       logging.info("No translation in the locale of %s\n", args.locale)
> +    else:
> +        # check if the files are directories or files
> +        new_files = []
> +        for file in files:
> +            if os.path.isfile(file):
> +                new_files.append(file)
> +            elif os.path.isdir(file):
> +                # for directories, list all files in the directory and its subfolders
> +                new_files.extend(list_files_with_excluding_folders(
> +                    file, [], "rst"))
> +        files = new_files
>   
>       files = list(map(lambda x: os.path.relpath(os.path.abspath(x), linux_path), files))
>   

