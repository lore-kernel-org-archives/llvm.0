Received: from smtp.kernel.org (aws-us-west-2-korg-mail-1.web.codeaurora.org [10.30.226.201])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 1138235888;
	Tue, 28 Nov 2023 14:21:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; dkim=none
Received: by smtp.kernel.org (Postfix) with ESMTPSA id 74366C433A9;
	Tue, 28 Nov 2023 14:21:15 +0000 (UTC)
Date: Tue, 28 Nov 2023 09:21:37 -0500
From: Steven Rostedt <rostedt@goodmis.org>
To: kernel test robot <lkp@intel.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC][PATCH] tracing: Allow creating instances with specified
 system events
Message-ID: <20231128092137.447a8d32@gandalf.local.home>
In-Reply-To: <202311281631.XZ2umoXl-lkp@intel.com>
References: <20231127174108.3c331c9c@gandalf.local.home>
	<202311281631.XZ2umoXl-lkp@intel.com>
X-Mailer: Claws Mail 3.19.1 (GTK+ 2.24.33; x86_64-pc-linux-gnu)
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=US-ASCII
Content-Transfer-Encoding: 7bit

On Tue, 28 Nov 2023 17:43:17 +0800
kernel test robot <lkp@intel.com> wrote:

> All warnings (new ones prefixed by >>):
> 
> >> kernel/trace/trace.c:9640: warning: Function parameter or member 'systems' not described in 'trace_array_get_by_name'  
> 

I was wondering if the robot would catch that ;-)

-- Steve
