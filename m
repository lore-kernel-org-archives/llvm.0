Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 54C46C148
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 04:02:24 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758513747; cv=none; b=Moa4+GzGEOhe94lIvnEJo6J7EHB4yk2+SS5kkB5dq6IWumUrEAlY0nGmkP4611hqa1LdXTnf1BEmSdeSBQ0o2pBoIORVfICqlcPHQCOPbWdGDC0nN7cAUFa0i8KxvEysl8l5Eu7f0XdUKQjpdjL3xD9sAOe2F9TZe+vvDAPM8Sk=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758513747; c=relaxed/simple;
	bh=7+C0p+qyV0q+8wlycgjLWVdM/NywK9Sj5l7CZg0J4gY=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=q4YKeXFMFeuLCBP2Qb8MYp66zVmwJ5OxCBLsnpm1sGmSMO5Vw4q9Y4lDw2rR8W+AYO64Jj0xbqIoliwmdWfkfHCzsgGWicZ7qD6FoDmPVcUeHsq6xUcpt4AEunXkzHnw55Qc1hgmlt4JG5oIDNhCurGVJyIc8ELZq5KsKfKcn1U=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=ZvY5eHUE; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="ZvY5eHUE"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758513743;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=Z6zZFxwJ9ZAhmniTQPPfkSuYNWj2TtUT8jfbTMrwhxc=;
	b=ZvY5eHUE+p04cXfOB7oYuXAeZ7KeKF/E8+Q+eGx5yda3jet6ho+PmJ2QBbb8yYajb+zu10
	VorEa6QDatbBhhdGC35yrB4QWYIM25K+RugsVzfcVYF02WVxRhky0JEfoDTkO+SmywIofF
	RPBNH43vfxH1yfhDZweRAohPXiSQhc8=
Received: from mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-45-dGTHfWiPO9Ge99e7xHNAwg-1; Mon,
 22 Sep 2025 00:02:20 -0400
X-MC-Unique: dGTHfWiPO9Ge99e7xHNAwg-1
X-Mimecast-MFC-AGG-ID: dGTHfWiPO9Ge99e7xHNAwg_1758513740
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 138801800451
	for <llvm@lists.linux.dev>; Mon, 22 Sep 2025 04:02:20 +0000 (UTC)
Received: from [172.20.26.51] (unknown [10.30.44.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 5438319560BB;
	Mon, 22 Sep 2025 04:02:19 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.17.0-rc6,
 upstream-mainline, 2d5bd41a)
Date: Mon, 22 Sep 2025 04:02:19 -0000
To: bgoncalv@redhat.com, ftjahjad@redhat.com, llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <35243.125092200022000319@us-mta-45.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: AGVByyvDUANuNSNb1lERYFmKZ3PEH4vkFvSZrEOsA6I_1758513740
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED


Kernel information:
    Commit message: Merge tag 'clk-fixes-for-linus' of git://git.kernel.org=
/pub/scm/linux/kernel/git/clk/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2052384239

One or more kernel tests failed:
    Unrecognized or new issues:
        Boot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2052384239_x86_64_kernel-debug_kcidb_tool_19619370_6
                   Non-passing ran subtests:
                       =E2=9D=8C FAIL distribution/kpkginstall/journalctl-c=
heck
        Reboot test
              x86_64
                   Logs: https://datawarehouse.cki-project.org/kcidb/tests/=
redhat:2052384239_x86_64_kernel-debug_kcidb_tool_19619370_12
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

