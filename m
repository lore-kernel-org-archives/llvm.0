Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 130B47F7
	for <llvm@lists.linux.dev>; Sat, 20 Jan 2024 01:31:29 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1705714292; cv=none; b=VCY0/r6kLI91mPQicRIXbrZgwYI/Dscc9JJP3vrYxOYPyFLeH1tZ3gkj5qkAGeud7XnvEgDvZWC11hQ1WK0lcfpFJfFz7FFvZttwV6MuL4M3SElKWeVl2lkIFENsQWtX2ix/zO0RVmxtw0IAOQdYqayn0ggx3jeSZaiJpapY2tw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1705714292; c=relaxed/simple;
	bh=OPyWvdyJu/dQKQcaKMGOsGepMxidqIDxGeRLmndYno8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eM9BTMnB67YtXLkpO8Y8UocYPaWt2nW27g+00EQMl5iSN+0Ai3Sl2l45CKxB7HMvAcJDgkGysVLimv1ZJfN6S03K6gsLV3Npd0zqurgo06KaSFSOvsRc1Gi81gxIKVpqd05NHuLSUMnL9yTv7w96DSZb+Bu1Q4dlwXxU+tv2tCw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J0O5ukpD; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J0O5ukpD"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1705714288;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=YUAI6D82I/lpx9KKVr9YYyMv5B/R3wfjLjr63gyI1vU=;
	b=J0O5ukpDWKM1GJ0lYL9cbMuWKkdujKFb5ftl1PDnEslVQRroNnMJOI81Qi6xA6drNYblMk
	7IiDlxxSn9ADKgwCbJA45Z98vmZLZQCFoEG6rxUiFYI0P/hEMUG9VDD+gspMmiQ28o0sUX
	Cr9XnaXcdgdN3j91o/RoondcBcheVpU=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-do95W1AgMrKpr02vgnK7MQ-1; Fri, 19 Jan 2024 20:31:27 -0500
X-MC-Unique: do95W1AgMrKpr02vgnK7MQ-1
Received: from smtp.corp.redhat.com (int-mx02.intmail.prod.int.rdu2.redhat.com [10.11.54.2])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 3068785A58A
	for <llvm@lists.linux.dev>; Sat, 20 Jan 2024 01:31:27 +0000 (UTC)
Received: from [172.64.9.51] (unknown [10.30.34.184])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 1839040C6EBA;
	Sat, 20 Jan 2024 01:31:27 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 11 of 226): Test report for master
 (6.7.0, mainline.kernel.org-clang, 9d1694dc)
Date: Sat, 20 Jan 2024 01:31:26 -0000
To: llvm@lists.linux.dev, bgoncalv@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.2
Message-Id: <78455.124011920312700319@us-mta-284.us.mimecast.lan>
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
    Commit message: Merge tag 'for-6.8/block-2024-01-18' of git://git.kerne=
l.dk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/124097

One or more kernel tests failed:
    Unrecognized or new issues:
         ppc64le - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10984710
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
           s390x - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10984812
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 - Boot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10984639
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
          x86_64 (debug) - Reboot test
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
10984694
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
                  x86_64 - stress: stress-ng - cpu-cache
                  x86_64 - Reboot test
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: blktests nvme/ failure due to latest nvme-cli update
            URL: https://github.com/osandov/blktests/pull/131
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: nvme authentication setup failed observed during blktests nv=
me/041 nvme/042 nvme/043 nvme/044 nvme/045
            URL: https://lore.kernel.org/linux-nvme/CAHj4cs8vqrePA-TE_GGNAZ=
LG3iqZBq9L1GkanA4A0wRF_TXDeA@mail.gmail.com/
            Affected tests:
                 aarch64 - Storage - blktests - blk
                 aarch64 - Storage - blktests - nvme-tcp
                   s390x - Storage - blktests - blk
                   s390x - Storage - blktests - nvme-tcp
                  x86_64 - Storage - blktests - blk
                  x86_64 - Storage - blktests - nvme-tcp
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [upstream] RIP: 0010:ttm_device_init+0x20a/0x360 [ttm]
            URL: https://lore.kernel.org/all/20240113213347.9562-1-pchelkin=
@ispras.ru/
            Affected tests:
                  x86_64 - Boot test
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: xfstests: generic/354 file exists
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1654
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: xfstests generic/245: cannot overwrite File exists
            URL: https://www.spinics.net/lists/fstests/msg23667.html
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2
                  x86_64 (debug) - xfstests - cifsv3.11
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                  x86_64 (debug) - xfstests - nfsv4.2
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 - Memory function: memfd_create
      x86_64 - xfstests - ext4
      x86_64 - xfstests - xfs
      x86_64 - xfstests - btrfs
      x86_64 - xfstests - nfsv4.2
      x86_64 - xfstests - cifsv3.11
      x86_64 - Reboot test
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

