Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 61E25D50F
	for <llvm@lists.linux.dev>; Sun, 28 Jan 2024 08:11:34 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1706429496; cv=none; b=I6lyJ9e5FhOLTEK89wwH45LSvQThX0C8ca9w0A+5EfPe9UAp19wMTyTCGWfuQOGIbiCk0+6MfDhxP4oZ3tHhnmubis5LNorNkibTRDFamMVYAcL8gPseXmIexR9VPPngbfaKg+M8Wp5yEMwgG9LL/kE5pq1dm9jYdzY6XDAVNTc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1706429496; c=relaxed/simple;
	bh=k2Hi78yi7HSnQ6jD77MZCEcGlOIfo0AcickKNN6o30I=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Ze4qZZd92MOfZVlBEI6VkaM+x0JJLykGab6UrBS6pOe2d1nHUg43JUXSPmUs/7uFhXTLrxIMymmhJwMgb/VYPw+ggzIVBI/d5SmVO5ZtnmcLIBguMxEKHTWNYb7olGC60c6c2L1kmW5Kk4PDhRFBOFRZYsVElTbwaWUFnMHAKbk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NcsujkA/; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NcsujkA/"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1706429493;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=nhXXYqpie7+8rgZYM6ViI4Ts2PEzfzmSXyElv+rJtwQ=;
	b=NcsujkA/KAa3u/nUqMlkbj4zeCOzt1G+9nursWAcc9YrvWj/GxiIcLwuD01N8i6eMQU/8y
	lmk2gIA0DGPCX4bQ6YL4sitW52C6ydK8I2bSj8O8+scNFsDzKcoUC3sRBjR50FrXLPtY+f
	vz+b1JM2vhOEeEeNy4EybFGAHlZMpI4=
Received: from mimecast-mx02.redhat.com (mimecast-mx02.redhat.com
 [66.187.233.88]) by relay.mimecast.com with ESMTP with STARTTLS
 (version=TLSv1.3, cipher=TLS_AES_256_GCM_SHA384) id
 us-mta-74-bX1Df_MZMBSVZpBthPosYg-1; Sun, 28 Jan 2024 03:11:31 -0500
X-MC-Unique: bX1Df_MZMBSVZpBthPosYg-1
Received: from smtp.corp.redhat.com (int-mx08.intmail.prod.int.rdu2.redhat.com [10.11.54.8])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 2265F185A782
	for <llvm@lists.linux.dev>; Sun, 28 Jan 2024 08:11:31 +0000 (UTC)
Received: from [172.64.10.18] (unknown [10.30.34.11])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 0A2D7C15E61;
	Sun, 28 Jan 2024 08:11:31 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS (MISSED 12 of 226): Test report for master
 (6.8.0-rc1, mainline.kernel.org-clang, 3a5879d4)
Date: Sun, 28 Jan 2024 08:11:30 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.8
Message-Id: <95666.124012803113102875@us-mta-74.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: PASSED
             Merge: OK
           Compile: OK
              Test: OK

Tested-by: CKI Project <cki-project@redhat.com>

Kernel information:
    Commit message: Merge tag 'ata-6.8-rc2' of git://git.kernel.org/pub/scm=
/linux/kernel/git/libata/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/126072

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
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
        Issue: [rawhide] avc:  denied  { read write } for  pid=3D12364 comm=
=3D"plymouthd" name=3D"kmsg" dev=3D"devtmpfs" ino=3D10 scontext=3Dsystem_u:=
system_r:plymouthd_t:s0 tcontext=3Dsystem_u:object_r:kmsg_device_t:s0 tclas=
s=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2256442
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - Storage - swraid scsi_raid
                   s390x - Reboot test
                  x86_64 - Reboot test
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
        Issue: kselftest build - bpf: progs/test_bpf_nf.c:160:42: error: us=
e of undeclared identifier 'NF_NAT_MANIP_SRC'
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1418
            Affected tests:
                  x86_64 (debug) - kselftests upstream - bpf
                  x86_64 (debug) - kselftests upstream - bpf_test_progs
        Issue: [rawhide] avc:  denied  { checkpoint_restore } for  pid=3D79=
3 comm=3D"agetty" capability=3D40  scontext=3Dsystem_u:system_r:getty_t:s0-=
s0:c0.c1023 tcontext=3Dsystem_u:system_r:getty_t:s0-s0:c0.c1023 tclass=3Dca=
pability2 permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2259622
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - stress: stress-ng - cpu-cache
                 aarch64 - Reboot test
                 ppc64le - Boot test
                 ppc64le - Reboot test
                   s390x - Boot test
                   s390x - Storage - swraid scsi_raid
                   s390x - Reboot test
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                 aarch64 - Boot test
                 aarch64 - Reboot test
        Issue: Firmware test suite: mv: cannot stat 'dtcompilerparser.tab.c=
': No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1544
            Affected tests:
                 aarch64 - Hardware - Firmware test suite
        Issue: [upstream] stress-ng: avc denial on secretmemory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1752
            Affected tests:
                   s390x - stress: stress-ng - memory
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                 ppc64le - selinux-policy: serge-testsuite


Tests that were not ran because of internal issues:=20
     aarch64 - Memory function: memfd_create
     ppc64le - Memory function: memfd_create
       s390x - Memory function: memfd_create
      x86_64 - Memory function: memfd_create
      x86_64 (debug) - CKI/restraint
      x86_64 (debug) - SELinux Custom Module Setup
      x86_64 (debug) - machineinfo
      x86_64 (debug) - Boot test
      x86_64 (debug) - Hardware - CPU: Die Test
      x86_64 (debug) - Storage - swraid scsi_raid
      x86_64 (debug) - Reboot test
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

