Received: from mgamail.intel.com (mgamail.intel.com [198.175.65.10])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 228782E336F;
	Wed,  5 Mar 2025 03:37:17 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=198.175.65.10
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1741145839; cv=none; b=fNAzylQLP76whfOE1Li2gb/JNSwaQDreBXFrF0wYF1b8Hcicj+wFy8k9la8Y10GekEvFIZohYnt2xPS7V7NynfRyVS/0NwfuSIY1ZQSEhPNaVnb95TH+PsEJOC8penwNPCZlouX3LefWeZW7Y3QShkCz67chYs7XEaKdBR237lI=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1741145839; c=relaxed/simple;
	bh=As4AaS2QrdGkUrfaCFAT1NjGBx/1m1swGBVi4ckbZxA=;
	h=Date:From:To:Cc:Subject:Message-ID:References:MIME-Version:
	 Content-Type:Content-Disposition:In-Reply-To; b=cKpka/FADRL745lruhmyTaHKsfnjQYrkoz4S4A1/F1rINr3PVaE6N8QGTp4GMHxP0p+2AV7zwvJqMsfBTARze38dxtbqozYs2EnfezTRSjciijf8Q/MlgX4owBUV3RrY3gHwFDd3+/tZSJiOK3u3lYxu8RHN6QE/pJZY70VqIPI=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com; spf=pass smtp.mailfrom=intel.com; dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b=NBjpE0N0; arc=none smtp.client-ip=198.175.65.10
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=intel.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=intel.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (2048-bit key) header.d=intel.com header.i=@intel.com header.b="NBjpE0N0"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/simple;
  d=intel.com; i=@intel.com; q=dns/txt; s=Intel;
  t=1741145839; x=1772681839;
  h=date:from:to:cc:subject:message-id:references:
   mime-version:in-reply-to;
  bh=As4AaS2QrdGkUrfaCFAT1NjGBx/1m1swGBVi4ckbZxA=;
  b=NBjpE0N0Q6lavGTTpVYrlx/vPceMelBxuwzPoIOllmEQkwgO+Pg0KDx4
   k4eVsRo5zivlmbv3q2FsdodvzQigHSezoSfJ7w/T4OpfOlpqmJ+O7eXXp
   F8i9b7/2AaX5VxhPiQpnZI7K4s/FOR5yZ7jmRIrDIqpC5V0/vtLPREXba
   iplAJz2/6TaukzSkmuDnbaobgOvQ/vKXm8kEcGejuvz5p3gjqUAfAcIsU
   gnbxV9e+b8XEaKOuEdN74+V35qu52hhA540FqpGEp1bcj0F0BliVA7mjo
   prxRZsNYTbFVI53PdXo8Rze2ltrO4aED5acy+bW8CGP+dIakq1KPPg/1+
   w==;
X-CSE-ConnectionGUID: 5QkQDoebRHS+ZUJCT5rVcQ==
X-CSE-MsgGUID: zI9y0M0aQ0eXip0emQBuFA==
X-IronPort-AV: E=McAfee;i="6700,10204,11363"; a="59502809"
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="59502809"
Received: from orviesa002.jf.intel.com ([10.64.159.142])
  by orvoesa102.jf.intel.com with ESMTP/TLS/ECDHE-RSA-AES256-GCM-SHA384; 04 Mar 2025 19:37:18 -0800
X-CSE-ConnectionGUID: gavLC1jQSqWESaztU0HaqQ==
X-CSE-MsgGUID: n/xedTjBSd6tazpY4/Jccg==
X-ExtLoop1: 1
X-IronPort-AV: E=Sophos;i="6.14,221,1736841600"; 
   d="scan'208";a="149339412"
Received: from lkp-server02.sh.intel.com (HELO 76cde6cc1f07) ([10.239.97.151])
  by orviesa002.jf.intel.com with ESMTP; 04 Mar 2025 19:37:16 -0800
Received: from kbuild by 76cde6cc1f07 with local (Exim 4.96)
	(envelope-from <lkp@intel.com>)
	id 1tpfZK-000KY2-0g;
	Wed, 05 Mar 2025 03:37:14 +0000
Date: Wed, 5 Mar 2025 11:36:52 +0800
From: kernel test robot <lkp@intel.com>
To: Tingmao Wang <m@maowtm.org>
Cc: llvm@lists.linux.dev, oe-kbuild-all@lists.linux.dev
Subject: Re: [RFC PATCH 9/9] Enhance the sandboxer example to support
 landlock-supervise
Message-ID: <202503051100.TdwYRUDj-lkp@intel.com>
References: <9dc2b112c4be1aadff612b226c603db66ef79955.1741047969.git.m@maowtm.org>
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
Content-Type: text/plain; charset=us-ascii
Content-Disposition: inline
In-Reply-To: <9dc2b112c4be1aadff612b226c603db66ef79955.1741047969.git.m@maowtm.org>

Hi Tingmao,

[This is a private test report for your RFC patch.]
kernel test robot noticed the following build warnings:

[auto build test WARNING on linus/master]
[also build test WARNING on v6.14-rc5 next-20250304]
[If your patch is applied to the wrong git tree, kindly drop us a note.
And when submitting patch, we suggest to use '--base' as documented in
https://git-scm.com/docs/git-format-patch#_base_tree_information]

url:    https://github.com/intel-lab-lkp/linux/commits/Tingmao-Wang/Define-the-supervisor-and-event-structure/20250304-092354
base:   linus/master
patch link:    https://lore.kernel.org/r/9dc2b112c4be1aadff612b226c603db66ef79955.1741047969.git.m%40maowtm.org
patch subject: [RFC PATCH 9/9] Enhance the sandboxer example to support landlock-supervise
config: i386-buildonly-randconfig-004-20250305 (https://download.01.org/0day-ci/archive/20250305/202503051100.TdwYRUDj-lkp@intel.com/config)
compiler: clang version 19.1.7 (https://github.com/llvm/llvm-project cd708029e0b2869e80abe31ddb175f7c35361f90)
reproduce (this is a W=1 build): (https://download.01.org/0day-ci/archive/20250305/202503051100.TdwYRUDj-lkp@intel.com/reproduce)

If you fix the issue in a separate patch/commit (i.e. not just a new version of
the same patch/commit), kindly add following tags
| Reported-by: kernel test robot <lkp@intel.com>
| Closes: https://lore.kernel.org/oe-kbuild-all/202503051100.TdwYRUDj-lkp@intel.com/

All warnings (new ones prefixed by >>):

>> samples/landlock/sandboxer.c:1193:4: warning: label followed by a declaration is a C23 extension [-Wc23-extensions]
    1193 |                         ssize_t count = read(supervisor_fd, io_buf, io_buf_len);
         |                         ^
   1 warning generated.


vim +1193 samples/landlock/sandboxer.c

  1001	
  1002	int interactive_sandboxer(int supervisor_fd, int child_stdin, int child_stdout,
  1003				  int child_stderr, pid_t child_pid)
  1004	{
  1005		char *write_buf = NULL;
  1006		size_t write_buf_len = 0;
  1007	
  1008		size_t io_buf_len = 4096;
  1009		char *io_buf = malloc(io_buf_len);
  1010		if (!io_buf) {
  1011			fprintf(stderr, "Failed to allocate I/O buffer");
  1012			return -1;
  1013		}
  1014	
  1015		int status = 0;
  1016	
  1017		struct pollfd pfds[5] = {
  1018			{ .fd = STDIN_FILENO, .events = POLLIN },
  1019			{ .fd = child_stdout, .events = POLLIN },
  1020			{ .fd = child_stderr, .events = POLLIN },
  1021			{ .fd = supervisor_fd, .events = POLLIN },
  1022			{ .fd = child_stdin, .events = POLLOUT },
  1023		};
  1024		const int pfd_idx_stdin = 0;
  1025		const int pfd_idx_child_stdout = 1;
  1026		const int pfd_idx_child_stderr = 2;
  1027		const int pfd_idx_supervisor = 3;
  1028		const int pfd_idx_child_stdin = 4;
  1029		const int poll_len = 5;
  1030	
  1031		struct context context = {
  1032			.supervisor_fd = supervisor_fd,
  1033			.allowed_paths = NULL,
  1034			.num_allowed_paths = 0,
  1035		};
  1036	
  1037		bool child_stdin_closed = false;
  1038	
  1039		/*
  1040		 * Don't deadlock by us trying to write to child, and child
  1041		 * waiting to write to us.
  1042		 */
  1043		f_set_noblock(child_stdin);
  1044	
  1045		/* Don't get killed by SIGPIPE when child closes stdout/err */
  1046		signal(SIGPIPE, SIG_IGN);
  1047	
  1048		while (1) {
  1049			if (write_buf_len > 0 && !child_stdin_closed) {
  1050				pfds[pfd_idx_child_stdin].fd = child_stdin;
  1051			} else {
  1052				pfds[pfd_idx_child_stdin].fd = -1;
  1053			}
  1054	
  1055			for (int i = 0; i < poll_len; i++) {
  1056				pfds[i].revents = 0;
  1057			}
  1058	
  1059			if (ppoll(pfds, poll_len, NULL, NULL) < 0) {
  1060				if (errno != EINTR) {
  1061					perror("ppoll");
  1062					goto err_kill_child;
  1063				}
  1064			}
  1065	
  1066			if (pfds[0].revents & POLLIN) {
  1067				/*
  1068				 * Our stdin -> temp buffer for child's stdin.
  1069				 * Need to do this before handling any supervisor
  1070				 * events so that inputs intended for the child is
  1071				 * not interperted as user decision.
  1072				 */
  1073				const int read_len = 4096;
  1074				write_buf =
  1075					realloc(write_buf, write_buf_len + read_len);
  1076				if (!write_buf) {
  1077					fprintf(stderr,
  1078						"Failed to realloc write buffer\n");
  1079					goto err_kill_child;
  1080				}
  1081				ssize_t count = read(STDIN_FILENO,
  1082						     write_buf + write_buf_len,
  1083						     read_len);
  1084				if (count > 0) {
  1085					write_buf_len += count;
  1086				} else if (count == 0) {
  1087					/* Our stdin is closed. Don't read from it anymore. */
  1088					pfds[pfd_idx_stdin].fd = -1;
  1089				} else {
  1090					perror("Failed to read from stdin");
  1091					goto err_kill_child;
  1092				}
  1093			}
  1094	
  1095			if (write_buf_len > 0) {
  1096				/* Attempt to write any outstanding stdin to child */
  1097				ssize_t written =
  1098					write(child_stdin, write_buf, write_buf_len);
  1099				if (written > 0) {
  1100					if (written > write_buf_len) {
  1101						abort();
  1102					} else if (written == write_buf_len) {
  1103						write_buf_len = 0;
  1104					} else {
  1105						memmove(write_buf, write_buf + written,
  1106							write_buf_len - written);
  1107						write_buf_len -= written;
  1108					}
  1109				} else {
  1110					if (errno == EPIPE) {
  1111						close(child_stdin);
  1112						child_stdin_closed = true;
  1113						pfds[pfd_idx_child_stdin].fd = -1;
  1114						write_buf_len = 0;
  1115					} else if (errno != EAGAIN) {
  1116						perror("Failed to write to child stdin");
  1117						goto err_kill_child;
  1118					}
  1119				}
  1120			}
  1121	
  1122			if (pfds[pfd_idx_stdin].fd == -1 && write_buf_len == 0) {
  1123				/* We can safely close child's stdin now */
  1124				close(child_stdin);
  1125				child_stdin_closed = true;
  1126				pfds[pfd_idx_child_stdin].fd = -1;
  1127			}
  1128	
  1129			if (pfds[pfd_idx_child_stdout].revents & POLLIN) {
  1130				/* Child stdout -> our stdout */
  1131				ssize_t count = read(child_stdout, io_buf, io_buf_len);
  1132				if (count > 0) {
  1133					if (write_all(STDOUT_FILENO, io_buf, count) <
  1134					    0) {
  1135						perror("Failed to write to stdout");
  1136						goto err_kill_child;
  1137					}
  1138				} else if (count == 0 ||
  1139					   (count < 0 && errno == EPIPE)) {
  1140					close(child_stdout);
  1141					pfds[pfd_idx_child_stdout].fd = -1;
  1142				} else if (count < 0 && errno != EAGAIN) {
  1143					perror("Failed to read from child stdout");
  1144					goto err_kill_child;
  1145				}
  1146			}
  1147	
  1148			if (pfds[2].revents & POLLIN) {
  1149				/* Child stderr -> our stderr */
  1150				ssize_t count = read(child_stderr, io_buf, io_buf_len);
  1151				if (count > 0) {
  1152					if (write_all(STDERR_FILENO, io_buf, count) <
  1153					    0) {
  1154						perror("Failed to write to stderr");
  1155						goto err_kill_child;
  1156					}
  1157				} else if (count == 0 ||
  1158					   (count < 0 && errno == EPIPE)) {
  1159					close(child_stderr);
  1160					pfds[pfd_idx_child_stderr].fd = -1;
  1161				} else if (count < 0 && errno != EAGAIN) {
  1162					perror("Failed to read from child stderr");
  1163					goto err_kill_child;
  1164				}
  1165			}
  1166	
  1167			if (waitpid(child_pid, &status, WNOHANG) == child_pid) {
  1168				/*
  1169				 * Write out any remaining child stdout/stderr.
  1170				 * If child died, read would just return EOF.
  1171				 */
  1172				while (1) {
  1173					ssize_t count =
  1174						read(child_stdout, io_buf, io_buf_len);
  1175					if (count > 0)
  1176						write_all(STDOUT_FILENO, io_buf, count);
  1177					else
  1178						break;
  1179				}
  1180				while (1) {
  1181					ssize_t count =
  1182						read(child_stderr, io_buf, io_buf_len);
  1183					if (count > 0)
  1184						write_all(STDERR_FILENO, io_buf, count);
  1185					else
  1186						break;
  1187				}
  1188				return WIFEXITED(status) ? WEXITSTATUS(status) : 1;
  1189			}
  1190	
  1191			if (pfds[pfd_idx_supervisor].revents) {
  1192	retry:
> 1193				ssize_t count = read(supervisor_fd, io_buf, io_buf_len);

-- 
0-DAY CI Kernel Test Service
https://github.com/intel/lkp-tests/wiki
