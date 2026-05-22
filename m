Received: from mgamail.intel.com (mgamail.intel.com [192.198.163.17])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 2E6103F9F38;
	Fri, 22 May 2026 13:37:07 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=192.198.163.17
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1779457030; cv=none; b=IU85TcmjZAb8wAUEou2C6lYgJSylqYIB4j2vJ3xHwC4xDDLQQvy5Fk7wF7wxYe5pJQUbT7DvkEsjYVondeXZc2+XijCTetptjdSsN1j9avDnlUT3yAlAb1VP+zxdx0IBnFofvpwwURyw62L5FJB5KZ5SJZFOrUj2OEqWpP7Gfqk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1779457030; c=relaxed/simple;
	bh=2ezQtFQmKDwNCJIJgo9zQAY9gN45tMJURjm0EBYofdY=;
	h=Date:From:To:Cc:Subject:Message-ID; b=lIM02KjuWHfhASUCsvl30WvEQl5RcBfINMGUaJkd4oyc+ozU+TJp+zf1UHWkDwdEdK8kRPrObwlCy7omg5Zv2abgvLwILqAJOhJYvusHKm8f7jh2lYklgevu8nqWmoEPtjrG34dSB0rkGpxPVakhlwpdHTDBgNC3D6GMbQIGkgM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=dCnWvTk2; arc=none smtp.client-ip=192.198.163.17
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="dCnWvTk2"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1779457028; x=1810993028;
  h=date:from:to:cc:subject:message-id;
  bh=2ezQtFQmKDwNCJIJgo9zQAY9gN45tMJURjm0EBYofdY=;
  b=dCnWvTk2sgPW5j/D9SQ00DyPdYUXknLFtpL8XkQ68chmeewCdksBi1sp
   KZzlLK/eU5F49P2aCVjKXh5ElXg3w8hH/FrS2S0QpTYveVgbB19+lG6cW
   oGVb55FXyqgFQGNxF64kC3ON4wbKpMwzpWX+rR2tQZziDzOoiHeoLsK6G
   seol30bEf4QWp/YuU15K66EbNbE2A3dwY4DHTHANdyflnODjUD9HFfmRW
   45l7XdRJFrBX9cEnnUYwMxDJeKAQvrQzMAl5LPAr7U2AAGWq8O2YGy3eK
   un/WJ2PY2p4gAGZNoWP99iFG/Tt3neJ5wBCYBD2ILDAeDLOxKGAMSMqWx
   Q==;
X-CSE-ConnectionGUID: 95kQQewCTk+lnHbFWSEKWA==
X-CSE-MsgGUID: c6hnZ4pNTe+MBEO8r6/RiA==
X-IronPort-AV: E=McAfee;i="6800,10657,11794"; a="80237467"
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="80237467"
Received: from orviesa007.jf.intel.com ([10.64.159.147])
  by fmvoesa111.fm.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 22 May 2026 06:37:07 -0700
X-CSE-ConnectionGUID: A2/uevOmSCe5VRf5wTaZUQ==
X-CSE-MsgGUID: MzRXGtqpSi+U8bIPUtcmkg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.24,162,1774335600"; 
   d="scan'208";a="241145290"
Received: from lkp-server01.sh.intel.com (HELO fdb68b0ce653) ([10.239.97.150])
  by orviesa007.jf.intel.com with ESMTP; 22 May 2026 06:37:05 -0700
Received: from kbuild by fdb68b0ce653 with local (Exim 4.98.2)
	(envelope-from <lkp@intel.com>)
	id 1wQQ3j-000000002UB-0RTw;
	Fri, 22 May 2026 13:37:03 +0000
Date: Fri, 22 May 2026 21:36:16 +0800
From: kernel test robot <lkp@intel.com>
To: "Christian A. Ehrhardt" <christian.ehrhardt@codasip.com>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: [scosu-sched:topic/mmap-cap-prot/v7.0 821/1197]
 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:594:44: warning:
 format specifies type 'unsigned long' but the argument has type '__u64' (aka
 'unsigned long long')
Message-ID: <202605222105.QhCZcqud-lkp@intel.com>
User-Agent: s-nail v14.9.25
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>

tree:   https://github.com/scosu/linux-sched topic/mmap-cap-prot/v7.0
head:   af9683ebfd23308f714cc478321fb01e5c4a7104
commit: 2ce6e372240ca43055026eea7f659d9cc9e6adc9 [821/1197] cheri: Fix compile in drivers/staging/
config: loongarch-allmodconfig (https://download.01.org/0day-ci/archive/20260522/202605222105.QhCZcqud-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20260522/202605222105.QhCZcqud-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202605222105.QhCZcqud-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c:594:44: warning: format specifies type 'unsigned long' but the argument has type '__u64' (aka 'unsigned long long') [-Wformat]
     592 |         dev_dbg(instance->state->dev, "arm: instance %p, cmd %s, arg %lx\n", instance,
         |                                                                      ~~~
         |                                                                      %llx
     593 |                 ((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
     594 |                 ioctl_names[_IOC_NR(cmd)] : "<invalid>", __c_ua(arg));
         |                                                          ^~~~~~~~~~~
   include/linux/dev_printk.h:165:39: note: expanded from macro 'dev_dbg'
     165 |         dynamic_dev_dbg(dev, dev_fmt(fmt), ##__VA_ARGS__)
         |                                      ~~~     ^~~~~~~~~~~
   include/linux/dynamic_debug.h:285:19: note: expanded from macro 'dynamic_dev_dbg'
     285 |                            dev, fmt, ##__VA_ARGS__)
         |                                 ~~~    ^~~~~~~~~~~
   include/linux/dynamic_debug.h:261:59: note: expanded from macro '_dynamic_func_call'
     261 |         _dynamic_func_call_cls(_DPRINTK_CLASS_DFLT, fmt, func, ##__VA_ARGS__)
         |                                                                  ^~~~~~~~~~~
   include/linux/dynamic_debug.h:259:65: note: expanded from macro '_dynamic_func_call_cls'
     259 |         __dynamic_func_call_cls(__UNIQUE_ID(ddebug), cls, fmt, func, ##__VA_ARGS__)
         |                                                                        ^~~~~~~~~~~
   include/linux/dynamic_debug.h:231:15: note: expanded from macro '__dynamic_func_call_cls'
     231 |                 func(&id, ##__VA_ARGS__);                       \
         |                             ^~~~~~~~~~~
   1 warning generated.


vim +594 drivers/platform/raspberrypi/vchiq-interface/vchiq_dev.c

   582	
   583	static long
   584	vchiq_ioctl(struct file *file, unsigned int cmd, unsigned long arg)
   585	{
   586		struct vchiq_instance *instance = file->private_data;
   587		int status = 0;
   588		struct vchiq_service *service = NULL;
   589		long ret = 0;
   590		int i, rc;
   591	
   592		dev_dbg(instance->state->dev, "arm: instance %p, cmd %s, arg %lx\n", instance,
   593			((_IOC_TYPE(cmd) == VCHIQ_IOC_MAGIC) && (_IOC_NR(cmd) <= VCHIQ_IOC_MAX)) ?
 > 594			ioctl_names[_IOC_NR(cmd)] : "<invalid>", __c_ua(arg));
   595	
   596		switch (cmd) {
   597		case VCHIQ_IOC_SHUTDOWN:
   598			if (!instance->connected)
   599				break;
   600	
   601			/* Remove all services */
   602			i = 0;
   603			while ((service = next_service_by_instance(instance->state,
   604								   instance, &i))) {
   605				status = vchiq_remove_service(instance, service->handle);
   606				vchiq_service_put(service);
   607				if (status)
   608					break;
   609			}
   610			service = NULL;
   611	
   612			if (!status) {
   613				/* Wake the completion thread and ask it to exit */
   614				instance->closing = 1;
   615				complete(&instance->insert_event);
   616			}
   617	
   618			break;
   619	
   620		case VCHIQ_IOC_CONNECT:
   621			if (instance->connected) {
   622				ret = -EINVAL;
   623				break;
   624			}
   625			rc = mutex_lock_killable(&instance->state->mutex);
   626			if (rc) {
   627				dev_err(instance->state->dev,
   628					"arm: vchiq: connect: could not lock mutex for state %d: %d\n",
   629					instance->state->id, rc);
   630				ret = -EINTR;
   631				break;
   632			}
   633			status = vchiq_connect_internal(instance->state, instance);
   634			mutex_unlock(&instance->state->mutex);
   635	
   636			if (!status)
   637				instance->connected = 1;
   638			else
   639				dev_err(instance->state->dev,
   640					"arm: vchiq: could not connect: %d\n", status);
   641			break;
   642	
   643		case VCHIQ_IOC_CREATE_SERVICE: {
   644			struct vchiq_create_service __user *argp;
   645			struct vchiq_create_service args;
   646	
   647			argp = (void __user *)arg;
   648			if (copy_from_user(&args, argp, sizeof(args))) {
   649				ret = -EFAULT;
   650				break;
   651			}
   652	
   653			ret = vchiq_ioc_create_service(instance, &args);
   654			if (ret < 0)
   655				break;
   656	
   657			if (put_user(args.handle, &argp->handle)) {
   658				vchiq_remove_service(instance, args.handle);
   659				ret = -EFAULT;
   660			}
   661		} break;
   662	
   663		case VCHIQ_IOC_CLOSE_SERVICE:
   664		case VCHIQ_IOC_REMOVE_SERVICE: {
   665			unsigned int handle = __c_ua(arg);
   666			struct user_service *user_service;
   667	
   668			service = find_service_for_instance(instance, handle);
   669			if (!service) {
   670				ret = -EINVAL;
   671				break;
   672			}
   673	
   674			user_service = service->base.userdata;
   675	
   676			/*
   677			 * close_pending is false on first entry, and when the
   678			 * wait in vchiq_close_service has been interrupted.
   679			 */
   680			if (!user_service->close_pending) {
   681				status = (cmd == VCHIQ_IOC_CLOSE_SERVICE) ?
   682					 vchiq_close_service(instance, service->handle) :
   683					 vchiq_remove_service(instance, service->handle);
   684				if (status)
   685					break;
   686			}
   687	
   688			/*
   689			 * close_pending is true once the underlying service
   690			 * has been closed until the client library calls the
   691			 * CLOSE_DELIVERED ioctl, signalling close_event.
   692			 */
   693			if (user_service->close_pending &&
   694			    wait_for_completion_interruptible(&user_service->close_event))
   695				status = -EAGAIN;
   696			break;
   697		}
   698	
   699		case VCHIQ_IOC_USE_SERVICE:
   700		case VCHIQ_IOC_RELEASE_SERVICE:	{
   701			unsigned int handle = __c_ua(arg);
   702	
   703			service = find_service_for_instance(instance, handle);
   704			if (service) {
   705				ret = (cmd == VCHIQ_IOC_USE_SERVICE) ?
   706					vchiq_use_service_internal(service) :
   707					vchiq_release_service_internal(service);
   708				if (ret) {
   709					dev_err(instance->state->dev,
   710						"suspend: cmd %s returned error %ld for service %p4cc:%03d\n",
   711						(cmd == VCHIQ_IOC_USE_SERVICE) ?
   712						"VCHIQ_IOC_USE_SERVICE" :
   713						"VCHIQ_IOC_RELEASE_SERVICE",
   714						ret, &service->base.fourcc,
   715						service->client_id);
   716				}
   717			} else {
   718				ret = -EINVAL;
   719			}
   720		} break;
   721	
   722		case VCHIQ_IOC_QUEUE_MESSAGE: {
   723			struct vchiq_queue_message args;
   724	
   725			if (copy_from_user(&args, (const void __user *)arg,
   726					   sizeof(args))) {
   727				ret = -EFAULT;
   728				break;
   729			}
   730	
   731			service = find_service_for_instance(instance, args.handle);
   732	
   733			if (service && (args.count <= MAX_ELEMENTS)) {
   734				/* Copy elements into kernel space */
   735				struct vchiq_element elements[MAX_ELEMENTS];
   736	
   737				if (copy_from_user(elements, args.elements,
   738						   args.count * sizeof(struct vchiq_element)) == 0)
   739					ret = vchiq_ioc_queue_message(instance, args.handle, elements,
   740								      args.count);
   741				else
   742					ret = -EFAULT;
   743			} else {
   744				ret = -EINVAL;
   745			}
   746		} break;
   747	
   748		case VCHIQ_IOC_QUEUE_BULK_TRANSMIT:
   749		case VCHIQ_IOC_QUEUE_BULK_RECEIVE: {
   750			struct vchiq_queue_bulk_transfer args;
   751			struct vchiq_queue_bulk_transfer __user *argp;
   752	
   753			enum vchiq_bulk_dir dir =
   754				(cmd == VCHIQ_IOC_QUEUE_BULK_TRANSMIT) ?
   755				VCHIQ_BULK_TRANSMIT : VCHIQ_BULK_RECEIVE;
   756	
   757			argp = (void __user *)arg;
   758			if (copy_from_user(&args, argp, sizeof(args))) {
   759				ret = -EFAULT;
   760				break;
   761			}
   762	
   763			ret = vchiq_irq_queue_bulk_tx_rx(instance, &args,
   764							 dir, &argp->mode);
   765		} break;
   766	
   767		case VCHIQ_IOC_AWAIT_COMPLETION: {
   768			struct vchiq_await_completion args;
   769			struct vchiq_await_completion __user *argp;
   770	
   771			argp = (void __user *)arg;
   772			if (copy_from_user(&args, argp, sizeof(args))) {
   773				ret = -EFAULT;
   774				break;
   775			}
   776	
   777			ret = vchiq_ioc_await_completion(instance, &args,
   778							 &argp->msgbufcount);
   779		} break;
   780	
   781		case VCHIQ_IOC_DEQUEUE_MESSAGE: {
   782			struct vchiq_dequeue_message args;
   783	
   784			if (copy_from_user(&args, (const void __user *)arg,
   785					   sizeof(args))) {
   786				ret = -EFAULT;
   787				break;
   788			}
   789	
   790			ret = vchiq_ioc_dequeue_message(instance, &args);
   791		} break;
   792	
   793		case VCHIQ_IOC_GET_CLIENT_ID: {
   794			unsigned int handle = __c_ua(arg);
   795	
   796			ret = vchiq_get_client_id(instance, handle);
   797		} break;
   798	
   799		case VCHIQ_IOC_GET_CONFIG: {
   800			struct vchiq_get_config args;
   801			struct vchiq_config config;
   802	
   803			if (copy_from_user(&args, (const void __user *)arg,
   804					   sizeof(args))) {
   805				ret = -EFAULT;
   806				break;
   807			}
   808			if (args.config_size > sizeof(config)) {
   809				ret = -EINVAL;
   810				break;
   811			}
   812	
   813			vchiq_get_config(&config);
   814			if (copy_to_user(args.pconfig, &config, args.config_size)) {
   815				ret = -EFAULT;
   816				break;
   817			}
   818		} break;
   819	
   820		case VCHIQ_IOC_SET_SERVICE_OPTION: {
   821			struct vchiq_set_service_option args;
   822	
   823			if (copy_from_user(&args, (const void __user *)arg,
   824					   sizeof(args))) {
   825				ret = -EFAULT;
   826				break;
   827			}
   828	
   829			service = find_service_for_instance(instance, args.handle);
   830			if (!service) {
   831				ret = -EINVAL;
   832				break;
   833			}
   834	
   835			ret = vchiq_set_service_option(instance, args.handle, args.option,
   836						       args.value);
   837		} break;
   838	
   839		case VCHIQ_IOC_LIB_VERSION: {
   840			unsigned int lib_version = __c_ua(arg);
   841	
   842			if (lib_version < VCHIQ_VERSION_MIN)
   843				ret = -EINVAL;
   844			else if (lib_version >= VCHIQ_VERSION_CLOSE_DELIVERED)
   845				instance->use_close_delivered = 1;
   846		} break;
   847	
   848		case VCHIQ_IOC_CLOSE_DELIVERED: {
   849			unsigned int handle = __c_ua(arg);
   850	
   851			service = find_closed_service_for_instance(instance, handle);
   852			if (service) {
   853				struct user_service *user_service =
   854					(struct user_service *)service->base.userdata;
   855				close_delivered(user_service);
   856			} else {
   857				ret = -EINVAL;
   858			}
   859		} break;
   860	
   861		default:
   862			ret = -ENOTTY;
   863			break;
   864		}
   865	
   866		if (service)
   867			vchiq_service_put(service);
   868	
   869		if (ret == 0) {
   870			if (status == -EINVAL)
   871				ret = -EIO;
   872			else if (status == -EAGAIN)
   873				ret = -EINTR;
   874		}
   875	
   876		if (!status && (ret < 0) && (ret != -EINTR) && (ret != -EWOULDBLOCK)) {
   877			dev_dbg(instance->state->dev,
   878				"arm: ioctl instance %p, cmd %s -> status %d, %ld\n",
   879				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
   880				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
   881		} else {
   882			dev_dbg(instance->state->dev,
   883				"arm: ioctl instance %p, cmd %s -> status %d\n, %ld\n",
   884				instance, (_IOC_NR(cmd) <= VCHIQ_IOC_MAX) ?
   885				ioctl_names[_IOC_NR(cmd)] : "<invalid>", status, ret);
   886		}
   887	
   888		return ret;
   889	}
   890	

--
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
