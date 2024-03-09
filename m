Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 7DE5F2E64C
	for <llvm@lists.linux.dev>; Sat,  9 Mar 2024 07:01:30 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1709967694; cv=none; b=OSciXSMoKadS1ygCMiGmpSBkiyAVA6XsegoNA93bFZVOUoo+HD+l+hgJnb7qxZrmb8+owqOYKxM16vNq4gvN+GQIbJohLSU3K5IIMyC5ZjH9EH1Yrxg/zb7TjnxdDmIeTolLIDmj5+SNUE6o0hslDEUgvtONDqpEN0JdyNxeVB0=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1709967694; c=relaxed/simple;
	bh=5ANYPtAdf/i7QeP+XM4e9ysWty7qPyAkB3LgtifERmQ=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=nOxlcXRRa6+FvXmxYas89DoXuwaMTg1mxomlV+REzicnc+jYAcoYBrrmn9Lkom6ysyGVDT/WJRZNsKVFdCmgr+LKP0jEWlZDCSUBVa/JRN1YS6ATEfSQl2FwLErtLqHpQu2fjmL+cIMwIhUrL1zXZ8ZdpIpEvQZmZ51OHghT7fw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=busqzY/u; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="busqzY/u"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1709967689;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=dZcQg3seVixiK5R/qXUu90iYvmeRXpSm0dGxRb8TDQo=;
	b=busqzY/uehymI4EW2cpXpKGISZSsUUkS92hvpR8Um5IjrjVkSaATJ+mrWMgek0gomOoXuV
	0iwpsUFM2wCbWdaFbuFr9lAHvn4WtyhZVUcYIVno6ws+y++iHRfxWtcmA5cScGaM0qMQ2g
	0NpkNYU16gwIWzf/zioULN1/HJgutFo=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-284-fVQRzuhYNAKwMGJIyUka6Q-1; Sat, 09 Mar 2024 02:01:22 -0500
X-MC-Unique: fVQRzuhYNAKwMGJIyUka6Q-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 29934185A789
	for <llvm@lists.linux.dev>; Sat,  9 Mar 2024 07:01:22 +0000 (UTC)
Received: from [172.64.5.48] (unknown [10.30.32.29])
	by smtp.corp.redhat.com (Postfix) with ESMTP id D50CEC04220;
	Sat,  9 Mar 2024 07:01:21 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 5 of 204): Test report for master
 (6.8.0-rc7, mainline.kernel.org-clang, 09e5c48f)
Date: Sat, 09 Mar 2024 07:01:21 -0000
To: llvm@lists.linux.dev, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <09659.124030902012200119@us-mta-284.us.mimecast.lan>
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
    Commit message: Merge tag 'ceph-for-6.8-rc8' of https://github.com/ceph=
/ceph-client

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/133523

One or more kernel tests failed:
    Unrecognized or new issues:
          x86_64 (debug) - xfstests - xfs
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11604843
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/157
                       =E2=9D=8C FAIL generic/161
                       =E2=9D=8C FAIL generic/171
                       =E2=9D=8C FAIL generic/172
                       =E2=9D=8C FAIL generic/173
                       =E2=9D=8C FAIL generic/174
                       =E2=9D=8C FAIL generic/183
                       =E2=9D=8C FAIL generic/185
                       =E2=9D=8C FAIL generic/188
                       =E2=9D=8C FAIL generic/189
                       =E2=9D=8C FAIL generic/190
                       =E2=9D=8C FAIL generic/191
                       =E2=9D=8C FAIL generic/194
                       =E2=9D=8C FAIL generic/195
                       =E2=9D=8C FAIL generic/196
                       =E2=9D=8C FAIL generic/197
                       =E2=9D=8C FAIL generic/199
                       =E2=9D=8C FAIL generic/200
                       =E2=9D=8C FAIL generic/201
                       =E2=9D=8C FAIL generic/202
                       =E2=9D=8C FAIL generic/203
                       =E2=9D=8C FAIL generic/205
                       =E2=9D=8C FAIL generic/206
                       =E2=9D=8C FAIL generic/216
                       =E2=9D=8C FAIL generic/217
                       =E2=9D=8C FAIL generic/220
                       =E2=9D=8C FAIL generic/222
                       =E2=9D=8C FAIL generic/227
                       =E2=9D=8C FAIL generic/238
                       =E2=9D=8C FAIL generic/253
                       =E2=9D=8C FAIL generic/259
                       =E2=9D=8C FAIL generic/261
                       =E2=9D=8C FAIL generic/262
                       =E2=9D=8C FAIL generic/264
                       =E2=9D=8C FAIL generic/287
                       =E2=9D=8C FAIL generic/289
                       =E2=9D=8C FAIL generic/290
                       =E2=9D=8C FAIL generic/291
                       =E2=9D=8C FAIL generic/292
                       =E2=9D=8C FAIL generic/293
                       =E2=9D=8C FAIL generic/295
                       =E2=9D=8C FAIL generic/296
                       =E2=9D=8C FAIL generic/301
                       =E2=9D=8C FAIL generic/302
                       =E2=9D=8C FAIL generic/305
                       =E2=9D=8C FAIL generic/326
                       =E2=9D=8C FAIL generic/327
                       =E2=9D=8C FAIL generic/328
                       =E2=9D=8C FAIL generic/330
                       =E2=9D=8C FAIL generic/332
                       =E2=9D=8C FAIL generic/353
                       =E2=9D=8C FAIL generic/358
                       =E2=9D=8C FAIL generic/359
                       =E2=9D=8C FAIL generic/372
                       =E2=9D=8C FAIL generic/414
                       =E2=9D=8C FAIL generic/493

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
                  x86_64 (debug) - Boot test
                  x86_64 (debug) - Reboot test
        Issue: [upstream] blktests tests/zbd/010 failed (WARNING: CPU: 22 P=
ID: 44011 at fs/iomap/iter.c:51)
            URL: https://lore.kernel.org/linux-block/CAHj4cs-kfojYC9i0G73PR=
kYzcxCTex=3D-vugRFeP40g_URGvnfQ@mail.gmail.com/T/#u
            Affected tests:
                 aarch64 - Storage - blktests - blk - upstream
                   s390x - Storage - blktests - blk - upstream
                  x86_64 - Storage - blktests - blk - upstream
        Issue: stress: stress-ng - memory: (panic) Comm: systemd-oomd Not t=
ainted 6.1.0-rc3
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1461
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
                   s390x - stress: stress-ng - memory
                  x86_64 - stress: stress-ng - memory
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
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                   s390x - machineinfo
                   s390x - Boot test
                   s390x - Storage - blktests - blk - upstream
                   s390x - Storage - blktests - nvme-tcp - upstream
                   s390x - Storage - swraid scsi_raid
                   s390x - stress: stress-ng - cpu-cache
                   s390x - stress: stress-ng - memory
                   s390x - Reboot test
                   s390x - POSIX pjd-fstest suites
                   s390x - Filesystem - Loopdev Sanity
                   s390x - AMTU (Abstract Machine Test Utility)
                   s390x - Networking cki netfilter test
                   s390x - Networking vnic: ipvlan/basic
                   s390x - Libkcapi AF_ALG test


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
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

