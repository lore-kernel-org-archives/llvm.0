Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 559481EF36E
	for <llvm@lists.linux.dev>; Sun, 26 Oct 2025 03:03:15 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1761447799; cv=none; b=UAecdMQKKxACUfo9tmrrkE4sZGajfjLqet7swp9ebW8pLRSfTU4UdUuFx0AeOw5KQaIicyYVcoGnh4i3hYAoTijhXodTkTGiIsBBIe4jki4EZ+i/FcJZPHE/V8sPePDL0sHskez04TyFvNylmLEP2tw0bdT6JxgFB0agaKBknUA=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1761447799; c=relaxed/simple;
	bh=1NLCHLMmIphzIkHdaO6xzbdbB3tiLdH5L/35j19iMU8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=KKnRYGLKLVtYTAiFCcE+ezvomRQ2m08CO0/YLjVw/QB0dvCrVX70soKzMlk3aUcJlc12jIdTliJH7Fna7AbIHfOeZzqdDnS/CVBTSK04iyNJxHVX5a1CqcqFaTG/gM//MjVwQ4a+iKZCOeuxreTBQsd6KyxuXfHuNtQRbQApktM=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=Ei15RwWd; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="Ei15RwWd"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1761447794;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=PVxqgRQWnkAW8j757mtUnHhk7BX0/vuFeWw8KJVL9nI=;
	b=Ei15RwWdDxn6IReWjfQxqWfWHYNBlnWxRrBIR7mpRdBPwQfsWHO450TUjprR1PD1WLVXId
	NfnZoOFlFEZ7e0fqUW1H0PmpjzruHz7NgklmMjsh09LP0kT4IMki830Gl25ux5/P+mJtRu
	l9KecK8Nc9tYCIrI4eJTqPeClj3OhCU=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-592-U08n_Ln1ObmoAzKSk_Ewbg-1; Sat,
 25 Oct 2025 23:03:12 -0400
X-MC-Unique: U08n_Ln1ObmoAzKSk_Ewbg-1
X-Mimecast-MFC-AGG-ID: U08n_Ln1ObmoAzKSk_Ewbg_1761447792
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id E0F2E1801376
	for <llvm@lists.linux.dev>; Sun, 26 Oct 2025 03:03:11 +0000 (UTC)
Received: from [172.20.84.201] (unknown [10.30.45.119])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F1E341800587;
	Sun, 26 Oct 2025 03:03:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.18.0-rc2,
 upstream-mainline, 72761a7e)
Date: Sun, 26 Oct 2025 03:03:10 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <02826.125102523031200500@us-mta-592.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: PxP3qK2ROA1IBcYWeyDOxxqsT8TokznPgox7ejkBGEQ_1761447792
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'driver-core-6.18-rc3' of git://git.kernel.or=
g/pub/scm/linux/kernel/git/driver-core/driver-core

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2120590533

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2120590533_x86_64_kernel-debug_kcidb_tool_19853865_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2120590533_x86_64_kernel-debug_kcidb_tool_19853865_12
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL misc/reboot-test/journalctl-check

    We also see the following known issues which are not related to your ch=
anges:
        Issue: (ppc64le) selinux-policy: serge-testsuite: ld: cannot find a=
rch/powerpc/lib/crtsavres.o: No such file or directory
            URL: https://issues.redhat.com/browse/RHELTEST-39
            Affected tests:
                selinux-policy: serge-testsuite [ppc64le]
        Issue: [rawhide] avc:  denied  { remove_name } for  pid=3D11534 com=
m=3D"systemd-ssh-iss" name=3D"50-ssh-vsock.issue" dev=3D"tmpfs" ino=3D2323 =
scontext=3Dsystem_u:system_r:systemd_ssh_issue_t:s0 tcontext=3Dsystem_u:obj=
ect_r:var_run_t:s0 tclass=3Ddir permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D2391966
            Affected tests:
                Boot test [s390x]
                Reboot test [s390x]
        Issue: [net] [kselftests upstream] catch all failures
            URL: https://issues.redhat.com/browse/RHELTEST-1362
            Affected tests:
                kselftests upstream - bpf [x86_64, x86_64]
                kselftests upstream - bpf_test_progs [x86_64, x86_64]
                kselftests upstream - net [x86_64, x86_64]
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
            Affected tests:
                xfstests - nfsv4.2 [x86_64, x86_64]
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

