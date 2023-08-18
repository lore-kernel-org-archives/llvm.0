Received: from netrider.rowland.org (netrider.rowland.org [192.131.102.5])
	by smtp.subspace.kernel.org (Postfix) with SMTP id 60C7B18B11
	for <llvm@lists.linux.dev>; Fri, 18 Aug 2023 13:52:43 +0000 (UTC)
Received: (qmail 30393 invoked by uid 1000); 18 Aug 2023 09:52:35 -0400
Date: Fri, 18 Aug 2023 09:52:35 -0400
From: Alan Stern <stern@rowland.harvard.edu>
To: kernel test robot <lkp@intel.com>
Cc: Badhri Jagan Sridharan <badhri@google.com>, llvm@lists.linux.dev,
  oe-kbuild-all@lists.linux.dev,
  Greg Kroah-Hartman <gregkh@linuxfoundation.org>
Subject: Re: [stable:linux-6.1.y 6854/8698] drivers/usb/gadget/udc/core.c:56:
 warning: Function parameter or member 'vbus_work' not described in 'usb_udc'
Message-ID: <bbd143c9-afc9-4231-b4fc-e095d9b15bd2@rowland.harvard.edu>
References: <202308181228.oUyNPyxW-lkp@intel.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <202308181228.oUyNPyxW-lkp@intel.com>

On Fri, Aug 18, 2023 at 12:41:40PM +0800, kernel test robot wrote:
> tree:   https://git.kernel.org/pub/scm/linux/kernel/git/stable/linux-stable.git linux-6.1.y
> head:   6c44e13dc284f7f4db17706ca48fd016d6b3d49a
> commit: 3c048d42c305cba61c2040702778023a7b973b22 [6854/8698] usb: gadget: udc: core: Offload usb_udc_vbus_handler processing
> config: i386-randconfig-i001-20230817 (https://download.01.org/0day-ci/archive/20230818/202308181228.oUyNPyxW-lkp@intel.com/config)
> compiler: clang version 16.0.4 (https://github.com/llvm/llvm-project.git ae42196bc493ffe877a7e3dff8be32035dea4d07)
> reproduce: (https://download.01.org/0day-ci/archive/20230818/202308181228.oUyNPyxW-lkp@intel.com/reproduce)
> 
> If you fix the issue in a separate patch/commit (i.e. not just a new version of
> the same patch/commit), kindly add following tags
> | Reported-by: kernel test robot <lkp@intel.com>
> | Closes: https://lore.kernel.org/oe-kbuild-all/202308181228.oUyNPyxW-lkp@intel.com/
> 
> All warnings (new ones prefixed by >>):
> 
> >> drivers/usb/gadget/udc/core.c:56: warning: Function parameter or member 'vbus_work' not described in 'usb_udc'

This has already been fixed by commit 159a98afc88e ("USB: gadget: core: 
Add missing kerneldoc for vbus_work") in linux-next.

Alan Stern

