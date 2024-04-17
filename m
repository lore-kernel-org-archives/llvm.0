Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 306BC14884A;
	Wed, 17 Apr 2024 15:52:39 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=217.140.110.172
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1713369163; cv=none; b=p/Sgxl4/G/FvYtDWCqcjpc/g7q4gPSQip56NR+DCQVV/Jl8Q/O/G6zPfug7Ac2B4l8mLXnAAV/lONQZNevyxWhLKr8i5VC9WneEP3FTH1N8yNoJnH2Y22G/FBqaNob2T9lwh3JFXkz37MhWrsROSodgFDWsU0Rh3y8NbUxqEk84=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1713369163; c=relaxed/simple;
	bh=kuX3OcKWgILgSLAxfzh2AQyYp1j6PjeGzoP26JTex64=;
	h=Message-ID:Date:MIME-Version:Subject:To:Cc:References:From:
	 In-Reply-To:Content-Type; b=JguTLacoZQV8Xxv8ucUyetzqoEOfkiom6FNXY/kTtmBv4CANTnsszcBt+6EXqMukUUI8WBh9UC/J7UTsRJt4gorJwpp6bzkO+/2snZc5fKlZSwAFaGfWKREuZC9H1oODaOHF+WJbUfKGXhabRo7TDNxG9DImdorwoXdAsK0HriU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com; spf=pass smtp.mailfrom=arm.com; arc=none smtp.client-ip=217.140.110.172
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=arm.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=arm.com
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id 4185B339;
	Wed, 17 Apr 2024 08:53:07 -0700 (PDT)
Received: from [10.1.37.181] (XHFQ2J9959.cambridge.arm.com [10.1.37.181])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id 670BD3F792;
	Wed, 17 Apr 2024 08:52:38 -0700 (PDT)
Message-ID: <28b20153-62d8-40f2-9305-60943696d4a1@arm.com>
Date: Wed, 17 Apr 2024 16:52:36 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla Thunderbird
Subject: Re: clang: error: unknown argument '-static-libasan'; did you mean
 '-static-libsan'?
Content-Language: en-GB
To: Arnd Bergmann <arnd@arndb.de>, kernel test robot <yujie.liu@intel.com>
Cc: oe-kbuild-all@lists.linux.dev, linux-kernel@vger.kernel.org,
 Andrew Morton <akpm@linux-foundation.org>, llvm@lists.linux.dev,
 Linux Memory Management List <linux-mm@kvack.org>
References: <202404141807.LgsqXPY5-lkp@intel.com>
 <31b4e05d-62c6-44cd-8038-7ac8d21320c3@arm.com>
 <a5516289-96b6-41f4-8cbb-6c34c7bf7996@app.fastmail.com>
 <1f384d41-4c65-4efb-a171-26b54dacfb30@arm.com>
 <e95bb670-7c20-496f-80e1-8b1891816764@app.fastmail.com>
From: Ryan Roberts <ryan.roberts@arm.com>
In-Reply-To: <e95bb670-7c20-496f-80e1-8b1891816764@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 17/04/2024 16:23, Arnd Bergmann wrote:
> On Wed, Apr 17, 2024, at 17:11, Ryan Roberts wrote:
>> On 16/04/2024 15:42, Arnd Bergmann wrote:
>>> On Tue, Apr 16, 2024, at 16:33, Ryan Roberts wrote:
>>>
>>> I'm not entirely sure how much of the Kbuild infrastructure we
>>> can rely on here. If the .config file gets included, this should
>>> work:
>>
>> Thanks for the pointers. Unfortunately neither don't works as we don't have any
>> of the Kbuild infrastructure.
>>
>> I'm not really sure what to do here. The best I've come up with so far is to
>> just remove asan from these binaries. They are pretty simple selftests. I'm not
>> sure its adding a whole lot of value anyway.
>>
>> Does anyone have any advice?
>>
> 
>>> Alternatively, if the cc-option macro is available, you could
>>> try this one
>>>
>>> CFLAGS += $(call cc-option, -static-libasan) $(call cc-option, -static-libsan) 
> 
> I had another look at this and found example code in
> tools/thermal/tmon/Makefile that you should be able to adapt.
> Apparently the cc-option macro is not provided by default, but
> there is a copy you can include:
> 
> # We need this for the "cc-option" macro.
> include ../../build/Build.include
> WARNFLAGS=-Wall -Wshadow -W -Wformat -Wimplicit-function-declaration -Wimplicit-int
> override CFLAGS+= $(call cc-option,-O3,-O1) ${WARNFLAGS}
> # Add "-fstack-protector" only if toolchain supports it.
> override CFLAGS+= $(call cc-option,-fstack-protector-strong)

Ahh thanks! That sorted it:

diff --git a/tools/testing/selftests/fchmodat2/Makefile
b/tools/testing/selftests/fchmodat2/Makefile
index 71ec34bf1501..a68bb5a00797 100644
--- a/tools/testing/selftests/fchmodat2/Makefile
+++ b/tools/testing/selftests/fchmodat2/Makefile
@@ -1,6 +1,9 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
+# We need this for the "cc-option" macro.
+include ../../../build/Build.include

-CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined -static-libasan
$(KHDR_INCLUDES)
+CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined $(KHDR_INCLUDES)
+CFLAGS += $(call cc-option, -static-libasan) $(call cc-option, -static-libsan)
 TEST_GEN_PROGS := fchmodat2_test

 include ../lib.mk
diff --git a/tools/testing/selftests/openat2/Makefile
b/tools/testing/selftests/openat2/Makefile
index 254d676a2689..02af9b6ca5eb 100644
--- a/tools/testing/selftests/openat2/Makefile
+++ b/tools/testing/selftests/openat2/Makefile
@@ -1,8 +1,11 @@
 # SPDX-License-Identifier: GPL-2.0-or-later
+# We need this for the "cc-option" macro.
+include ../../../build/Build.include

-CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined -static-libasan
+CFLAGS += -Wall -O2 -g -fsanitize=address -fsanitize=undefined
+CFLAGS += $(call cc-option, -static-libasan) $(call cc-option, -static-libsan)
 TEST_GEN_PROGS := openat2_test resolve_test rename_attack_test

 include ../lib.mk

-$(TEST_GEN_PROGS): helpers.c helpers.h
+$(TEST_GEN_PROGS): helpers.c


I'll tidy this up and send it out.

Thanks,
Ryan


