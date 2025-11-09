Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 0D5A27B3E1
	for <llvm@lists.linux.dev>; Sun,  9 Nov 2025 07:23:18 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1762673000; cv=none; b=SrtfA0Dnv1S/bv/HyX0m+V8j/S8aX6VuxMeGGXxXfjNtLyN6gbC/krKkDuPfD2Th6n1p9NhSNH6qu8z2mhmm7AS1ySGkLTQt/hozj6l7trmw9yhctZXpYXS/UxDNjqComgPBSGcjzn5btCknWxFkUuFR56Fc0eihx8CRJ0Y9E4U=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1762673000; c=relaxed/simple;
	bh=lhBEw4PS7Il7gBQmxG0wQnSizrfOnsPPiVkyQYzQibc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=eLTz24EBr5KPYv9sZD249soUijFjSQdl4uAuUWqZuEovWg72uLgiHKcsPY+oB/6Jh7GkIX+w0K/vHVlKW5xfWjwpT16lacSp3x6z/CR+fNMhe+A5E86MnCODNLs/j4xDCgNfWrUwlORJv+YHqPWZ/J/znH9xbUdSv55tq14CKig=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=J9J8dJxn; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="J9J8dJxn"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1762672997;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=KaIcHFzyK2/uQMq+3FF3Or5gdK2CWtVi9eMuDfXz91Q=;
	b=J9J8dJxnn1uwX2xSsqO+f6jjRpeBE6V/6OUp96yo6mnO4hDaYtvNoCm/ZZLVLEY/9F5AFX
	LRiveuMNu2s5in1VrOUHEYPyMR+5cmFq2d8caFBQqPPSQLkK+p3lVXp1zdR37erV5s0Amv
	KPIWnB/fwR96ab9jB0rLhQkmqUxA40Q=
Received: from mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-93-65F1NmDXNn6lHBQ91Q0jAA-1; Sun,
 09 Nov 2025 02:23:16 -0500
X-MC-Unique: 65F1NmDXNn6lHBQ91Q0jAA-1
X-Mimecast-MFC-AGG-ID: 65F1NmDXNn6lHBQ91Q0jAA_1762672995
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-05.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 6380C1956080
	for <llvm@lists.linux.dev>; Sun,  9 Nov 2025 07:23:15 +0000 (UTC)
Received: from [172.20.1.36] (unknown [10.30.45.70])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 79DC519560A7;
	Sun,  9 Nov 2025 07:23:14 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0-rc4,
 upstream-mainline, 7bb4d651)
Date: Sun, 09 Nov 2025 07:23:14 -0000
To: ftjahjad@redhat.com, bgoncalv@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <29415.125110902231600269@us-mta-93.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: 4_LV-geyPZn71UNIJhSAgZUayDvPdENAQVjuhsMvCMY_1762672995
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'v6.18rc4-SMB-client-fixes' of git://git.samb=
a.org/sfrench/cifs-2.6

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2147801071

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2147801071_x86_64_kernel-debug_kcidb_tool_19957431_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2147801071_x86_64_kernel-debug_kcidb_tool_19957431_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: xfstests nfsv4.2 generic/221 failed to update ctime
            URL: https://issues.redhat.com/browse/RHELTEST-1805
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
        Issue: BUG: KASAN: slab-use-after-free in nfs_local_call_read
            URL: https://lore.kernel.org/linux-nfs/aPSvi5Yr2lGOh5Jh@dell-pe=
r750-06-vm-07.rhts.eng.pek2.redhat.com/
            Affected tests:
                xfstests - nfsv4.2 [x86_64]



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

