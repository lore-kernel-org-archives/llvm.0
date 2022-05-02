Received: from www262.sakura.ne.jp (www262.sakura.ne.jp [202.181.97.72])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id CE0957F
	for <llvm@lists.linux.dev>; Mon,  2 May 2022 07:09:23 +0000 (UTC)
Received: from fsav313.sakura.ne.jp (fsav313.sakura.ne.jp [153.120.85.144])
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTP id 2426WYTG008716;
	Mon, 2 May 2022 15:32:34 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Received: from www262.sakura.ne.jp (202.181.97.72)
 by fsav313.sakura.ne.jp (F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp);
 Mon, 02 May 2022 15:32:34 +0900 (JST)
X-Virus-Status: clean(F-Secure/fsigk_smtp/550/fsav313.sakura.ne.jp)
Received: from [192.168.1.9] (M106072142033.v4.enabler.ne.jp [106.72.142.33])
	(authenticated bits=0)
	by www262.sakura.ne.jp (8.15.2/8.15.2) with ESMTPSA id 2426WX6P008709
	(version=TLSv1.2 cipher=AES256-GCM-SHA384 bits=256 verify=NO);
	Mon, 2 May 2022 15:32:34 +0900 (JST)
	(envelope-from penguin-kernel@I-love.SAKURA.ne.jp)
Message-ID: <d9231649-d056-8622-9a2a-cf466c1e2834@I-love.SAKURA.ne.jp>
Date: Mon, 2 May 2022 15:32:29 +0900
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
User-Agent: Mozilla/5.0 (Windows NT 6.3; Win64; x64; rv:91.0) Gecko/20100101
 Thunderbird/91.8.1
Subject: Re: [tomoyo-test1:master 2/2]
 drivers/infiniband/core/device.c:2857:2: error: call to
 __compiletime_assert_500 declared with 'error' attribute: Please avoid
 flushing system_unbound_wq.
Content-Language: en-US
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
        linux-kernel@vger.kernel.org
References: <202205021448.6SzhD1Cz-lkp@intel.com>
From: Tetsuo Handa <penguin-kernel@I-love.SAKURA.ne.jp>
In-Reply-To: <202205021448.6SzhD1Cz-lkp@intel.com>
Content-Type: text/plain; charset=UTF-8
Content-Transfer-Encoding: 7bit

On 2022/05/02 15:20, kernel test robot wrote:
>>> drivers/infiniband/core/device.c:2857:2: error: call to __compiletime_assert_500 declared with 'error' attribute: Please avoid flushing system_unbound_wq.
>            flush_workqueue(system_unbound_wq);
>            ^

Hmm, it seems that I need to wait for 5.19-rc1 before I add this patch.
Dropped from tomoyo-test1.git tree. Thank you.
