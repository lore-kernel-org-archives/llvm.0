Received: from mga06.intel.com (mga06b.intel.com [134.134.136.31])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 4695123A8;
	Wed, 20 Jul 2022 20:50:15 +0000 (UTC)
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1658350216; x=1689886216;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=pnttfrm4INbhaI3ZBK5StWiXiz03Guj567vUvo8uGJI=;
  b=ZT/+p09RPtEDPcZpqvUVzaaM6FYRfquDVhwe9TUNgsgozavrvixNvuw/
   7lplDIMTxgBQ4XzjazXrmzDej7KV/pvZATPgxlJco1nnhxh7C/6rkQ2pQ
   Q2sV6k7reCGLnSjW+vqiJA3U0Ra7HgxebgBA/O5N/cjCXhhOlFkxilq3z
   Opqz9JN/89PVxmjWpH219Kqm4PiH+NRK4GU/VuNFmts2lv4UR/+4jOwne
   oMyFXAHBbM4g7Eo33fchnQjbystpE+5vN7DQzjuOZHchBqsK+zVz2fsKR
   jhg7oCxysG2iLxeRTfWMBd1kuSPTQ3G4NiPPgWYbWbQSePKseriDDApyA
   g==;
X-IronPort-AV: E=McAfee;i="6400,9594,10414"; a="348576105"
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="348576105"
Received: from fmsmga004.fm.intel.com ([10.253.24.48])
  by orsmga104.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 20 Jul 2022 13:50:15 -0700
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="5.92,287,1650956400"; 
   d="scan'208";a="666013711"
Received: from lkp-server01.sh.intel.com (HELO 7dfbdc7c7900) ([10.239.97.150])
  by fmsmga004.fm.intel.com with ESMTP; 20 Jul 2022 13:50:04 -0700
Received: from kbuild by 7dfbdc7c7900 with local (Exim 4.95)
	(envelope-from <lkp@intel.com>)
	id 1oEGdv-0000vb-Jv;
	Wed, 20 Jul 2022 20:50:03 +0000
Date: Thu, 21 Jul 2022 04:49:38 +0800
From: kernel test robot <lkp@intel.com>
To: Joel Slebodnick <jslebodn@redhat.com>, linux-kernel@vger.kernel.org
Cc: llvm@lists.linux.dev, kbuild-all@lists.01.org,
	Joel Slebodnick <jslebodn@redhat.com>, gregkh@linuxfoundation.org,
	f.fainelli@gmail.com, rjui@broadcom.com, sbranden@broadcom.com,
	bcm-kernel-feedback-list@broadcom.com, nsaenz@kernel.org,
	athierry@redhat.com, gustavoars@kernel.org, keescook@chromium.org,
	stefan.wahren@i2se.com, gascoar@gmail.com, ojaswin98@gmail.com,
	len.baker@gmx.com, jakobkoschel@gmail.com,
	linux-staging@lists.linux.dev, linux-rpi-kernel@lists.infradead.org,
	linux-arm-kernel@lists.infradead.org, jsavitz@redhat.com
Subject: Re: [PATCH] remove custom return values in vc04_services
Message-ID: <202207210405.zW5H9djg-lkp@intel.com>
References: <20220712181928.17547-1-jslebodn@redhat.com>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <20220712181928.17547-1-jslebodn@redhat.com>

Hi Joel,

Thank you for the patch! Yet something to improve:

[auto build test ERROR on v5.19-rc6]
[also build test ERROR on linus/master]
[cannot apply to staging/staging-testing next-20220720]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Joel-Slebodnick/remove-custom-return-values-in-vc04_services/20220713-022038
base:    32346491ddf24599decca06190ebca03ff9de7f8
config: powerpc-randconfig-r001-20220718 (https://download.01.org/0day-ci/archive/20220721/202207210405.zW5H9djg-lkp@intel.com/config)
compiler: clang version 15.0.0 (https://github.com/llvm/llvm-project dd5635541cd7bbd62cd59b6694dfb759b6e9a0d8)
reproduce (this is a W=1 build):
        wget https://raw.githubusercontent.com/intel/lkp-tests/master/sbin/make.cross -O ~/bin/make.cross
        chmod +x ~/bin/make.cross
        # install powerpc cross compiling tool for clang build
        # apt-get install binutils-powerpc-linux-gnu
        # https://github.com/intel-lab-lkp/linux/commit/cc7c5d7c4bbc057cd5426e71360c064d43018aba
        git remote add linux-review https://github.com/intel-lab-lkp/linux
        git fetch --no-tags linux-review Joel-Slebodnick/remove-custom-return-values-in-vc04_services/20220713-022038
        git checkout cc7c5d7c4bbc057cd5426e71360c064d43018aba
        # save the config file
        mkdir build_dir && cp config build_dir/.config
        COMPILER_INSTALL_PATH=$HOME/0day COMPILER=clang make.cross W=1 O=build_dir ARCH=powerpc SHELL=/bin/bash drivers/staging/vc04_services/vchiq-mmal/

If you fix the issue, kindly add following tag where applicable
Reported-by: kernel test robot <lkp@intel.com>

All errors (new ones prefixed by >>):

>> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:551:26: error: incomplete result type 'enum vchiq_status' in function definition
   static enum vchiq_status service_callback(enum vchiq_reason reason,
                            ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:551:13: note: forward declaration of 'enum vchiq_status'
   static enum vchiq_status service_callback(enum vchiq_reason reason,
               ^
>> drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:562:10: error: use of undeclared identifier 'VCHIQ_SUCCESS'
                   return VCHIQ_SUCCESS;
                          ^
   drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c:646:9: error: use of undeclared identifier 'VCHIQ_SUCCESS'
           return VCHIQ_SUCCESS;
                  ^
   3 errors generated.


vim +551 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c

7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  549  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  550  /* incoming event service callback */
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29 @551  static enum vchiq_status service_callback(enum vchiq_reason reason,
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  552  					  struct vchiq_header *header,
1e5f7325636abd drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Baidyanath Kundu       2020-07-13  553  					  unsigned int handle, void *bulk_ctx)
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  554  {
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  555  	struct vchiq_mmal_instance *instance = vchiq_get_service_userdata(handle);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  556  	u32 msg_len;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  557  	struct mmal_msg *msg;
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  558  	struct mmal_msg_context *msg_context;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  559  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  560  	if (!instance) {
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  561  		pr_err("Message callback passed NULL instance\n");
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29 @562  		return VCHIQ_SUCCESS;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  563  	}
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  564  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  565  	switch (reason) {
469fbb24ced37f drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  566  	case VCHIQ_MESSAGE_AVAILABLE:
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  567  		msg = (void *)header->data;
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  568  		msg_len = header->size;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  569  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  570  		DBG_DUMP_MSG(msg, msg_len, "<<< reply message");
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  571  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  572  		/* handling is different for buffer messages */
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  573  		switch (msg->h.type) {
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  574  		case MMAL_MSG_TYPE_BUFFER_FROM_HOST:
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  575  			vchiq_release_message(handle, header);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  576  			break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  577  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  578  		case MMAL_MSG_TYPE_EVENT_TO_HOST:
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  579  			event_to_host_cb(instance, msg, msg_len);
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  580  			vchiq_release_message(handle, header);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  581  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  582  			break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  583  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  584  		case MMAL_MSG_TYPE_BUFFER_TO_HOST:
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  585  			buffer_to_host_cb(instance, msg, msg_len);
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  586  			vchiq_release_message(handle, header);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  587  			break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  588  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  589  		default:
60d5c020bbc0e4 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  590  			/* messages dependent on header context to complete */
4bc58d16753b99 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Aishwarya Pant         2017-02-28  591  			if (!msg->h.context) {
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  592  				pr_err("received message context was null!\n");
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  593  				vchiq_release_message(handle, header);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  594  				break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  595  			}
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  596  
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  597  			msg_context = lookup_msg_context(instance,
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  598  							 msg->h.context);
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  599  			if (!msg_context) {
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  600  				pr_err("received invalid message context %u!\n",
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  601  				       msg->h.context);
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  602  				vchiq_release_message(handle, header);
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  603  				break;
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  604  			}
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  605  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  606  			/* fill in context values */
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  607  			msg_context->u.sync.msg_handle = header;
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  608  			msg_context->u.sync.msg = msg;
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  609  			msg_context->u.sync.msg_len = msg_len;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  610  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  611  			/* todo: should this check (completion_done()
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  612  			 * == 1) for no one waiting? or do we need a
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  613  			 * flag to tell us the completion has been
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  614  			 * interrupted so we can free the message and
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  615  			 * its context. This probably also solves the
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  616  			 * message arriving after interruption todo
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  617  			 * below
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  618  			 */
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  619  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  620  			/* complete message so caller knows it happened */
4e6bafdfb9f394 drivers/staging/vc04_services/bcm2835-camera/mmal-vchiq.c Michael Zoran          2017-03-08  621  			complete(&msg_context->u.sync.cmplt);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  622  			break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  623  		}
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  624  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  625  		break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  626  
469fbb24ced37f drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  627  	case VCHIQ_BULK_RECEIVE_DONE:
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  628  		bulk_receive_cb(instance, bulk_ctx);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  629  		break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  630  
469fbb24ced37f drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  631  	case VCHIQ_BULK_RECEIVE_ABORTED:
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  632  		bulk_abort_cb(instance, bulk_ctx);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  633  		break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  634  
469fbb24ced37f drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  635  	case VCHIQ_SERVICE_CLOSED:
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  636  		/* TODO: consider if this requires action if received when
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  637  		 * driver is not explicitly closing the service
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  638  		 */
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  639  		break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  640  
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  641  	default:
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  642  		pr_err("Received unhandled message reason %d\n", reason);
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  643  		break;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  644  	}
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  645  
3c5da06f996995 drivers/staging/vc04_services/vchiq-mmal/mmal-vchiq.c     Nicolas Saenz Julienne 2020-06-29  646  	return VCHIQ_SUCCESS;
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  647  }
7b3ad5abf027b7 drivers/staging/media/platform/bcm2835/mmal-vchiq.c       Eric Anholt            2017-01-27  648  

-- 
0-DAY CI Kernel Test Service
https://01.org/lkp
