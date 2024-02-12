Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0340563CB
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 05:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1707715892; cv=none; b=DMkVp1OJaDWSTPuxuWdBOgAPlrt5K4yFpo8+7ikiAO4NggQcQpo+/jcayJIowmthTaBVMJuXhlJnM8MGO+YNk8EAF4YiCxkqqKa21irGyNRRMqn1yUXcs7BCqpQq42+hxbXwDjxAPKAXmBiyR/uNPd6iexb9og03w2NoF6wqh+k=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1707715892; c=relaxed/simple;
	bh=5m3hGuyRABvddr2260yEBEqu76//tkzCvIMSv+Ex9YU=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Kigiz3MTcn+UORc1Vvx4LNSh43eggBEcXMdsMbe3oZG8AzlhYyNh2E/KC4oq0dfmqC1EU8eOxS1x+izH0pnBqWo4Q6glLywjBuJd+PwvEqlXbnEZiC9b1MhzxbQp86v3ET+UyOJY4WgUPvKtJvhBDnjj1BFa1KZRvRZW2oRBf9I=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZedIEl8t; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZedIEl8t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1707715888;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=QbmZTQqvcHVO+6oB4CgETUfyG1sCcAwNY86WiUB1aIg=;
	b=ZedIEl8tmoytnM7KVV/Djm8f4drQeHxm9mkjvaI2rm38/YRNBh5MA38rnycj3uLT+RCL0j
	Awt8mar7RDVPSVPvxziaTsMyer9chra1GQX0BntVW30jxlffzUvfXWr8fYTZZpXis4TgSg
	NvZuPeKUAlCmro3TdPkHbBkSeVaLHWU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-644-GPTXUbplO6uQpsKFJRdRIA-1; Mon,
 12 Feb 2024 00:31:27 -0500
X-MC-Unique: GPTXUbplO6uQpsKFJRdRIA-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 1186D29ABA00
	for <llvm@lists.linux.dev>; Mon, 12 Feb 2024 05:31:27 +0000 (UTC)
Received: from [172.64.11.29] (unknown [10.30.34.149])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1AE5740D1B60;
	Mon, 12 Feb 2024 05:31:26 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 24 of 226): Test report for master
 (6.8.0-rc3, mainline.kernel.org-clang, 2766f59c)
Date: Mon, 12 Feb 2024 05:31:26 -0000
To: jishi@redhat.com, jiji@redhat.com, yizhan@redhat.com, omosnace@redhat.com,
 czhong@redhat.com, xzhou@redhat.com, mm-qe@redhat.com, haliu@redhat.com,
 llvm@lists.linux.dev, zlang@redhat.com, fsuba@redhat.com, yiche@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <03395.124021200312700214@us-mta-644.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'timers_urgent_for_v6.8_rc4' of git://git.ker=
nel.org/pub/scm/linux/kernel/git/tip/tip

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/128872

One or more kernel tests failed:
    Unrecognized or new issues:
           s390x - Storage - blktests - blk
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296825
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL storage/blktests/tests/nvme/029
           s390x - Storage - blktests - nvme-tcp
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296826
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL nvme-tcp: storage/blktests/nvme/nvme-=
tcp/tests/nvme/029
           s390x - POSIX pjd-fstest suites
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296835
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Filesystem - Loopdev Sanity
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296836
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - AMTU (Abstract Machine Test Utility)
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296838
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Networking cki netfilter test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296840
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Networking vnic: ipvlan/basic
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296841
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Libkcapi AF_ALG test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296842
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Storage - multipath mapping test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296843
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Storage - lvm thinp sanity
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11296845
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - stress: stress-ng - cpu-cache
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: [Rawhide] Storage: ERROR: Could not build wheels for ruamel.=
yaml.clib, which is required to install pyproject.toml-based projects
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1859
            Affected tests:
                 ppc64le - Storage - dm/common
                   s390x - Storage - dm/common
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2


Tests that were not ran because of internal issues:=20
     aarch64 - Storage - blktests - blk
     aarch64 - Storage - blktests - nvme-tcp
     aarch64 - Storage - block - filesystem fio test
     aarch64 - Storage - block - queue scheduler test
     aarch64 - Storage - swraid scsi_raid
     aarch64 - stress: stress-ng - cpu-cache
     aarch64 - stress: stress-ng - memory
     aarch64 - Reboot test
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 - Hardware - CPU: Die Test
      x86_64 - Hardware - IPMI driver test
      x86_64 - Hardware - IPMItool loop stress test
      x86_64 - Storage - blktests - blk
      x86_64 - Storage - blktests - nvme-tcp
      x86_64 - Storage - block - filesystem fio test
      x86_64 - Storage - block - queue scheduler test
      x86_64 - Storage - swraid scsi_raid
      x86_64 - stress: stress-ng - cpu-cache
      x86_64 - stress: stress-ng - memory
      x86_64 - Reboot test
      x86_64 - Memory function: memfd_create
      x86_64 (debug) - Memory function: memfd_create


If you find a failure unrelated to your changes, please ask the test mainta=
iner to review it.
This will prevent the failures from being incorrectly reported in the futur=
e.

Please reply to this email if you have any questions about the tests that w=
e
ran or if you have any suggestions on how to make future tests more effecti=
ve.

        ,-.   ,-.
       ( C ) ( K )  Continuous
        `-',-.`-'   Kernel
          ( I )     Integration
           `-'
___________________________________________________________________________=
___

