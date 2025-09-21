Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id AAD2934BA28
	for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 14:53:12 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1758466395; cv=none; b=qzA0D/aBBJytulptxyKcHYBcqX2GXgHWuH8xYhoeMzjbXqd18B2ulVSgME9ywlNIlb/o6z5C/7smC6teiBCffKasvhHEG78YzvuTk32UDfNzvbNHMrBD7jxkLJ9LIBwDbTU0PF7NDX7BJgNkWm0LN+9CCFZdY5mtSz0hB+1HGQw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1758466395; c=relaxed/simple;
	bh=61cSvquqPqFV5yemkDOrD91cDbl4yTDYjb2AYaylTD8=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=YMFg9Itb+nEL0KnWejqCd4rWlBTHt+eq3Y5h0gLEdzkBBlA4o3rQhsTRDWs+kYGoNRTLf4tkIxFwdL75UwcVYOVpNCmkd6hzZGXGNmh3Ju2i5hD5rcrnXrtupC5o9Ws0SyS4b4bAvxP035zeLIfad2UnFw0QMzueb/hiCxn1OG4=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=C8C7JEft; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="C8C7JEft"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1758466391;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=k5fYylsQDnlMs0Zg7tu2GW/9LCb9efewyXmmkRS8Ihg=;
	b=C8C7JEftPa+to1EQ2qvpbwf5ZfkBySlq28/MAe2Fk1CB7UH1Jxx5tdViKGVjIjnQ5BmRzo
	eP+OqTMhVzmRD5jtehG6+ZJcCUvvj0AkUp6sMDjMisn+yXNUxk1j3Zdh288ckt8sBUhWZq
	cx+AKrjZSJbIPMFvxcy0g9sgCsKFKsU=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-199-Y0fOUzcbMQmypAHJsdIB6Q-1; Sun,
 21 Sep 2025 10:53:10 -0400
X-MC-Unique: Y0fOUzcbMQmypAHJsdIB6Q-1
X-Mimecast-MFC-AGG-ID: Y0fOUzcbMQmypAHJsdIB6Q_1758466389
Received: from mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.12])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 45ABE18004D8
	for <llvm@lists.linux.dev>; Sun, 21 Sep 2025 14:53:09 +0000 (UTC)
Received: from [172.20.26.51] (unknown [10.30.44.116])
	by mx-prod-int-03.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id A865D19560BB;
	Sun, 21 Sep 2025 14:53:08 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4pyF?= PASS: Test report for master (6.17.0-rc6,
 upstream-mainline, fce24200)
Date: Sun, 21 Sep 2025 14:53:08 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.12
Message-Id: <35769.125092110531000343@us-mta-199.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: ztczNFcoLfWxHNsugUgokLRkvCwqBopAxXRuzQwGB6E_1758466389
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
    Commit message: Merge tag 'scsi-fixes' of git://git.kernel.org/pub/scm/=
linux/kernel/git/jejb/scsi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2051871215

One or more kernel tests failed:
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
        Issue: avc:  denied  { name_bind } for  pid=3D897864 comm=3D"rpcbin=
d" src=3D63924 scontext=3Dsystem_u:system_r:rpcbind_t:s0 tcontext=3Dsystem_=
u:object_r:unreserved_port_t:s0 tclass=3Dudp_socket permissive=3D1
            URL: https://bugzilla.redhat.com/show_bug.cgi?id=3D1758147
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

