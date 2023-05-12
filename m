Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C5AA522601;
	Fri, 12 May 2023 22:59:17 +0000 (UTC)
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 3C6AEC4339B;
	Fri, 12 May 2023 22:59:17 +0000 (UTC)
Date: Fri, 12 May 2023 18:59:16 -0400
From: Steven Rostedt <rostedt@goodmis.org>
To: Ajay Kaher <akaher@vmware.com>
Cc: kernel test robot <lkp@intel.com>, "mhiramat@kernel.org"
 <mhiramat@kernel.org>, "shuah@kernel.org" <shuah@kernel.org>,
 "llvm@lists.linux.dev" <llvm@lists.linux.dev>,
 "oe-kbuild-all@lists.linux.dev" <oe-kbuild-all@lists.linux.dev>,
 "linux-kernel@vger.kernel.org" <linux-kernel@vger.kernel.org>,
 "linux-trace-kernel@vger.kernel.org" <linux-trace-kernel@vger.kernel.org>,
 "linux-kselftest@vger.kernel.org" <linux-kselftest@vger.kernel.org>,
 "chinglinyu@google.com" <chinglinyu@google.com>, Nadav Amit
 <namit@vmware.com>, Srivatsa Bhat <srivatsab@vmware.com>,
 "srivatsa@csail.mit.edu" <srivatsa@csail.mit.edu>, Alexey Makhalov
 <amakhalov@vmware.com>, Vasavi Sirnapalli <vsirnapalli@vmware.com>, Tapas
 Kundu <tkundu@vmware.com>, "er.ajay.kaher@gmail.com"
 <er.ajay.kaher@gmail.com>
Subject: Re: [PATCH v2 8/9] eventfs: moving tracing/events to eventfs
Message-ID: <20230512185916.22bda1a5@rorschach.local.home>
In-Reply-To: <400E4466-629C-4306-86B1-E8BA0CB5EF66@vmware.com>
References: <1683026600-13485-9-git-send-email-akaher@vmware.com>
	<202305030116.Gu6yyvKj-lkp@intel.com>
	<1CAC8265-A4F3-4AF6-80E4-8F264ED670A9@vmware.com>
	<20230509124559.0d5557ad@rorschach.local.home>
	<400E4466-629C-4306-86B1-E8BA0CB5EF66@vmware.com>
X-Mailer: Claws Mail 3.17.8 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Wed, 10 May 2023 11:11:15 +0000
Ajay Kaher <akaher@vmware.com> wrote:

> Sounds good. Thanks Steve :)
> Once you will merge below patch, I will rebase this patch in v3.

Feel free to just add it at the start of your queue. You just need to
keep the "From" line and it will be added as my patch.

-- Steve
