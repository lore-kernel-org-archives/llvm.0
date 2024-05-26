Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 31E5C374FE
	for <llvm@lists.linux.dev>; Sun, 26 May 2024 21:11:58 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1716757923; cv=none; b=BgDRoh6e8Um4qo+xa4pjczqLcgKsh8/YIEIKKtGtSplF2iTENRpdvy7SrTWXCAsFYavV5+/707ou8iK1A9cxsnjPpiEwrOJW8+sS1H48EKgqQ1z04J1sZPTmWvccsz8QxBKPVicpFskEAPAyhAQscq6OqGssSLl0FvKKjKAJ7to=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1716757923; c=relaxed/simple;
	bh=c/rvXiapLlWBNtX5OYVmRIdy+6ldPq9O5vsxKn0ZZq4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=K4EZX+75VpVTN2ZpinqMqv4X6UQCM1MX7+5VW50NUNov2fmZt5JfWQqKrXWxGjvYlLU3KxJ1LuftFm2Bg6vpXiVy4svDzOgZSppFFqMwlhuDyykMK5i71hdU6CPVXc+9626T71kxCaDRPHHxzPW2uWbl6sIHOnU4qlKhk7cP7vk=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=fpkCSEar; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="fpkCSEar"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1716757916;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=x7JHrvQQjm+gSW1LSr56cQN2h82gotaEBHeiSshwmOw=;
	b=fpkCSEarw3tkmkt7xLm+bYRsYKy/czH2Zh2cSmj8HbauV7f1zLNvgjBU+SxiMD89HZJyGT
	gCULqXmBi6dLXcU0bBAh3CpnkBjZmjdSZU4YmcIOGcnhBW+oSgHL9ys7qiEPvjLtia89qB
	MelwbyGg/jDH9x5o8q3/gtxv3sF5pj4=
Received: from mimecast-mx02.redhat.com (mx-ext.redhat.com [66.187.233.73])
 by relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-154-BfTaKK55P16U--FIVr_S3g-1; Sun,
 26 May 2024 17:11:53 -0400
X-MC-Unique: BfTaKK55P16U--FIVr_S3g-1
Received: from smtp.corp.redhat.com (int-mx04.intmail.prod.int.rdu2.redhat.com [10.11.54.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mimecast-mx02.redhat.com (Postfix) with ESMTPS id 72FB8380670B
	for <llvm@lists.linux.dev>; Sun, 26 May 2024 21:11:52 +0000 (UTC)
Received: from [172.64.0.115] (unknown [10.30.33.131])
	by smtp.corp.redhat.com (Postfix) with ESMTP id 5F2872026D68;
	Sun, 26 May 2024 21:11:51 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL (MISSED 12 of 204): Test report for master
 (6.9.0, mainline.kernel.org-clang, c1332049)
Date: Sun, 26 May 2024 21:11:51 -0000
To: jishi@redhat.com, haliu@redhat.com, fsuba@redhat.com, llvm@lists.linux.dev,
 yiche@redhat.com, zlang@redhat.com, jiji@redhat.com, xzhou@redhat.com
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.11.54.4
Message-Id: <12552.124052617115300195@us-mta-154.us.mimecast.lan>
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
    Commit message: Merge tag '6.10-rc-smb3-fixes-part2' of git://git.samba=
.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1305745986

One or more kernel tests failed:
    Unrecognized or new issues:
        Networking cki netfilter test
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1305745986-ppc64le-kernel_upt_10
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Networking vnic: ipvlan/basic
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1305745986-ppc64le-kernel_upt_11
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        POSIX pjd-fstest suites
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1305745986-ppc64le-kernel_upt_5
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL /10_avc_check
        Storage - dm/common
             ppc64le
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1305745986-ppc64le-kernel_upt_13
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL exit_code
        xfstests - cifsv3.11
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:1305745986-x86_64-kernel_upt_52
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL generic/590

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] SELinux is preventing systemd-userdbd from map_rea=
d, map_write access on the bpf labeled init_t.
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2250930
            Affected tests:
                Hardware - Firmware test suite [aarch64]
                Networking cki netfilter test [aarch64, s390x, x86_64]
                Networking vnic: ipvlan/basic [aarch64, s390x, x86_64]
                POSIX pjd-fstest suites [aarch64, s390x, x86_64]
                Storage - blktests - blk - upstream [aarch64, x86_64]
                stress: stress-ng - cpu-cache [aarch64, x86_64]
                stress: stress-ng - memory [aarch64, x86_64]
                xfstests - btrfs [aarch64, x86_64]
                xfstests - ext4 [aarch64, x86_64]
                xfstests - xfs [aarch64, x86_64]
        Issue: [eln] avc:  denied  { create } for  pid=3D1 comm=3D"systemd"=
 scontext=3Dsystem_u:system_r:init_t:s0 tcontext=3Dsystem_u:system_r:sshd_t=
:s0-s0:c0.c1023 tclass=3Dvsock_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2280320
            Affected tests:
                Boot test [aarch64, ppc64le, s390x, x86_64]
                Reboot test [aarch64, ppc64le, s390x, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64]
        Issue: [rawhide] [s390x] avc:  denied  { read write } for  pid=3D12=
701 comm=3D"systemd-user-ru" name=3D"z90crypt" dev=3D"devtmpfs" ino=3D103 s=
context=3Dsystem_u:system_r:systemd_logind_t:s0 tcontext=3Dsystem_u:object_=
r:crypt_device_t:s0 tclass=3Dchr_file permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2263825
            Affected tests:
                Boot test [s390x]
                Networking cki netfilter test [s390x]
                Networking vnic: ipvlan/basic [s390x]
                POSIX pjd-fstest suites [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://gitlab.com/redhat/centos-stream/tests/kernel/kerne=
l-tests/-/issues/1267
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]


Tests that were not ran because of internal issues:=20
    Boot test [s390x]
    CKI/restraint [s390x]
    machineinfo [ppc64le, s390x]
    Reboot test [s390x]
    SELinux Custom Module Setup [ppc64le, s390x]
    Storage - blktests - blk - upstream [s390x]
    Storage - blktests - nvme-tcp - upstream [s390x]
    Storage - swraid scsi_raid [s390x]
    stress: stress-ng - cpu-cache [s390x]
    stress: stress-ng - memory [s390x]


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

