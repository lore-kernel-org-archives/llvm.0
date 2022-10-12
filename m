Received: from foss.arm.com (foss.arm.com [217.140.110.172])
	by smtp.subspace.kernel.org (Postfix) with ESMTP id 5152C17CB
	for <llvm@lists.linux.dev>; Wed, 12 Oct 2022 08:26:12 +0000 (UTC)
Received: from usa-sjc-imap-foss1.foss.arm.com (unknown [10.121.207.14])
	by usa-sjc-mx-foss1.foss.arm.com (Postfix) with ESMTP id E004115A1;
	Wed, 12 Oct 2022 01:26:17 -0700 (PDT)
Received: from [10.57.65.190] (unknown [10.57.65.190])
	by usa-sjc-imap-foss1.foss.arm.com (Postfix) with ESMTPSA id D43063F67D;
	Wed, 12 Oct 2022 01:26:10 -0700 (PDT)
Message-ID: <84f832ae-bfc5-a718-e757-11c47164ec03@arm.com>
Date: Wed, 12 Oct 2022 09:26:09 +0100
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Macintosh; Intel Mac OS X 10.15; rv:102.0)
 Gecko/20100101 Thunderbird/102.3.2
Subject: Re: coresight: etm4x build failure with unrolled loops
To: Arnd Bergmann <arnd@kernel.org>, Luong Ngo <lngo@google.com>
Cc: llvm@lists.linux.dev, Nick Desaulniers <ndesaulniers@google.com>,
 Nathan Chancellor <nathan@kernel.org>
References: <CABgnqwAZW=ro3BWdjar97RLif5mdeNGz7XssiKFyHcnfnC+uqA@mail.gmail.com>
 <CABgnqwDx_tiQKonycPMKKDXnnhyoEvcvaBSZVeyNuVenJ2FrkQ@mail.gmail.com>
 <43ee826c-5f1a-4fb3-b644-49caf5778ad4@app.fastmail.com>
From: Suzuki K Poulose <suzuki.poulose@arm.com>
In-Reply-To: <43ee826c-5f1a-4fb3-b644-49caf5778ad4@app.fastmail.com>
Content-Type: text/plain; charset=UTF-8; format=flowed
Content-Transfer-Encoding: 7bit

Hi


On 12/10/2022 07:33, Arnd Bergmann wrote:
> On Wed, Oct 12, 2022, at 1:20 AM, Luong Ngo wrote:
>> Resend with another Arnd's email as arnd@arndb.be is not working any more.
> 
> arnd@arndb.de is my normal address, if you are seeing problems with it, can
> you tell me what went wrong? If you got a bounce, please forward that to
> my @kernel.org address.
> 
>>> Hello Arnd and Suzuki,
>>>
>>> We recently enable coresight driver in our kernel and the build failed with the exact same error that I found your discussion of same issue in this mail thread (https://lkml.org/lkml/2021/4/29/862). The suggestion fix by changing etm4x_relaxed_read32 with csdev_access_relaxed_read32 indeed fix the compilation error. However, the change was not upstreamed. Do you have insight into why the fix was not submitted?  Is there any chance for it to be submitted?

This was committed upstream, as :

4d45bc82df667, avaialable upstream since, v6.0-rc1.  However, I see
that it was not sufficient. We need the same fix for "write"
operatoins too. Something like :

diff --git a/drivers/hwtracing/coresight/coresight-etm4x.h 
b/drivers/hwtracing/coresight/coresight-etm4x.h
index 4b21bb79f168..38192eae55b3 100644
--- a/drivers/hwtracing/coresight/coresight-etm4x.h
+++ b/drivers/hwtracing/coresight/coresight-etm4x.h
@@ -525,7 +525,7 @@

  #define write_etm4x_sysreg_offset(val, offset, _64bit)                 \
  	do {                                                            \
-		if (__builtin_constant_p((offset)))                     \
+		if (__is_constexpr((offset)))                           \
			write_etm4x_sysreg_const_offset((val),          \
                                                         (offset));      \
                 else                                                    \

I will post this out and queue it as fixes for 6.1-rc1

Thanks
Suzuki

> 
> I think that issue came up again on the clangbuiltlinux project, and
> we concluded that we should resend one of the old patches, but I don't
> know if anyone did, or which one of the them we decided on. It should
> not be hard to fix.
> 
>      Arnd

