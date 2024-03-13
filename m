Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 381DA3F9E8
	for <llvm@lists.linux.dev>; Wed, 13 Mar 2024 12:10:20 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1710331824; cv=none; b=l9yKQvCEqECgUbR7RvJt3z4D3TmHPthQRWswmEN/pnauEpWRu8K5kX92k5CBpcR5rFMpRifpSgF1oviEXXQy1Ii7XLOaHCps36F429O1vOL1Z7x/5VpfZ/dKvI4K4FRTwwpM6EdDBpDcB8x+hXBRmHzeLhKJ/ps/GqurpKnNrzM=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1710331824; c=relaxed/simple;
	bh=YU+kuTbed9+Bbmf4RFHN9bPZZoD7q8RR8Eeq46gsWpY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=HDT0DHnTEMMTK4sMbZ4OMMC6iKzrfFFlTwBUennGIT6x6Jr0NqftLgOwzUtmX2bPEhosscpe78uaZZB6QN2UKpN+eqUmaqxTJSgdPdUsTURyEJPl6WGcE+K2GD2EpEq06l9EmBDE/ZoQnqoE1+2MjkzMDOkk2I4vqoXM5atGuJE=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=HmOUEu1t; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="HmOUEu1t"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1710331820;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=wRTf4vE/g5L1S3VTdEa3NIx4i0nAZ/xmB0ovri0NG90=;
	b=HmOUEu1tQfeu8h0kw5kGbbAQp55m1XZYvjqbdpNLacWVYkEtSTkhbhVq9o9g8rOxJPzc4H
	5Wj6WDW+heKWsZ6Z1PmLt6F0S04uPs8HoS5yTln8lqGBqWk9QHJEgMOQcZ+4TMMgKl1zWY
	VcK9uUe54By5r8hAt94WMc2cByND4DU=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-i_pBfeoTMouBP85imkMtQw-1; Wed,
 13 Mar 2024 08:10:15 -0400
X-MC-Unique: i_pBfeoTMouBP85imkMtQw-1
Received: from smtp.corp.redhat.com (int-mx10.intmail.prod.int.rdu2.redhat.com [10.11.54.10])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 7B2B31C00D0F;
	Wed, 13 Mar 2024 12:10:15 +0000 (UTC)
Received: from [172.64.4.48] (unknown [10.30.33.216])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 987EE492BD0;
	Wed, 13 Mar 2024 12:10:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 10 of 204): Test report for master
 (6.8.0, mainline.kernel.org-clang, cc4a875c)
Date: Wed, 13 Mar 2024 12:10:14 -0000
To: llvm@lists.linux.dev, shinichiro.kawasaki@wdc.com, yizhan@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.10
Message-Id: <29450.124031308101501169@us-mta-93.us.mimecast.lan>
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
    Commit message: Merge tag 'lsm-pr-20240312' of git://git.kernel.org/pub=
/scm/linux/kernel/git/pcmoore/lsm

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/134269

One or more kernel tests failed:
    Unrecognized or new issues:
           s390x - Storage - blktests - blk - upstream
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
11642246
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL Panic

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
                  x86_64 - Storage - blktests - blk - upstream
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                 aarch64 - stress: stress-ng - memory
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
       s390x - Storage - blktests - nvme-tcp - upstream
       s390x - Storage - swraid scsi_raid
       s390x - stress: stress-ng - cpu-cache
       s390x - stress: stress-ng - memory
       s390x - Reboot test
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

