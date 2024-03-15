Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id D94061870
	for <llvm@lists.linux.dev>; Fri, 15 Mar 2024 00:40:21 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710463224; cv=none; b=qsoVRcbTwy7Q2woenzFBsks47wJJZN1SDNgLIWI84aha4TyCkX1Ej+WmUwi+w7WP3UkhTLHHLZUhwpp7jPU6mCCq2HemQQa2U5+MqEXAHhUGsfXHIzBU7C3khgAzF5N1u9SPcYkNjJGNp1LLg5TSk/ZCvblFSt2w51RtI/HdFg4=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710463224; c=relaxed/simple;
	bh=NoSccAl9xGPK+oHiLgoTLVloq9O0AL5byWeM8LEUYNg=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=MOFDNNDhe5Oj96lx6BUDEM/Do/6YRdoR2OTmEE2UZMjHOBm6JXqkCWdgmox7Z/VM2KYnysM6sZO109pnEeyKB33SFcR6ilkMW0wSIrwAB/7SOsPEj/1pf+8JpSSIpfTa2DB/18AonlMJDvqHOJxE3v2NOL0lAh8JIK9zTFscb/E=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=JiSPVemR; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="JiSPVemR"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710463220;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=rD9PMe8yU5eMdaSane7c32I3yk5uyzvTEeoSSwBr95c=;
	b=JiSPVemRnlGhJyEftPSazXhKooUJ7DKJq4lpg9U0XEEylbUTfPS3NXamN2UYcJ87jgJs/v
	lDZTyao/y+KjqRicK88+H5lmOE+ocILRmtEB6OPSGKofL6Oyc1ER0vJf75UT0ovPDVgvLS
	vVpiLHtPgMkCEzo/rFowS6o/4NuJeRc=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-575-sXI0p-rONR2N34jpn06A1Q-1; Thu,
 14 Mar 2024 20:40:16 -0400
X-MC-Unique: sXI0p-rONR2N34jpn06A1Q-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 16D4D1C41A13;
	Fri, 15 Mar 2024 00:40:16 +0000 (UTC)
Received: from [172.64.4.48] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1F9F240C6DB3;
	Fri, 15 Mar 2024 00:40:15 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 22 of 204): Test report for master
 (6.8.0, mainline.kernel.org-clang, fe46a7dd)
Date: Fri, 15 Mar 2024 00:40:15 -0000
To: llvm@lists.linux.dev, bhe@redhat.com, shinichiro.kawasaki@wdc.com,
 yizhan@redhat.com, xiawu@redhat.com, yiyan@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <91457.124031420401600235@us-mta-575.us.mimecast.lan>
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
    Commit message: Merge tag 'sound-6.9-rc1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/tiwai/sound

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/134891

One or more kernel tests failed:
    Unrecognized or new issues:
         aarch64 - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11677907
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kdump-sysrq-c
         ppc64le - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11678073
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kdump-sysrq-c
           s390x - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11678086
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
           s390x - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11678112
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kdump-sysrq-c
          x86_64 - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11677961
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic
          x86_64 - kdump - sysrq-c
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11677991
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /kdump/kdump-sysrq-c

    We also see the following known issues which are not related to your ch=
anges:
        Issue: kselftest build - bpf: bpf-helpers.rst:20: (WARNING/2) Field=
 list ends without a blank line; unexpected unindent
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1405
            Affected tests:
                  x86_64 (debug) - kselftest build - bpf
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
                   s390x - Reboot test
                  x86_64 - Boot test
                  x86_64 - Reboot test
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                 aarch64 - Storage - blktests - blk - upstream
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
                  x86_64 - xfstests - cifsv3.11
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 - xfstests - nfsv4.2
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - POSIX pjd-fstest suites
                   s390x - Filesystem - Loopdev Sanity
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test
                   s390x - Reboot test


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     aarch64 - Reboot test
     ppc64le - Memory function: memfd_create
     ppc64le - kdump - file-load
     ppc64le - Reboot test
       s390x - Storage - blktests - nvme-tcp - upstream
       s390x - Storage - swraid scsi_raid
       s390x - stress: stress-ng - cpu-cache
       s390x - stress: stress-ng - memory
       s390x - Reboot test
       s390x - Memory function: memfd_create
       s390x - kdump - file-load
       s390x - Reboot test
      x86_64 (debug) - Memory function: memfd_create
      x86_64 - Storage - blktests - nvme-tcp - upstream
      x86_64 - Storage - swraid scsi_raid
      x86_64 - stress: stress-ng - cpu-cache
      x86_64 - stress: stress-ng - memory
      x86_64 - Reboot test
      x86_64 - Memory function: memfd_create
      x86_64 - kdump - file-load
      x86_64 - Reboot test


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

