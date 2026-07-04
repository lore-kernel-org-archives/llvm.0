Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 71C0531A07F
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 07:22:16 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1783149746; cv=none; b=bdTV2vElQwC6N3U1ReYtJxaWTzjl53yz16xGBYDAgTUDG+IZpfgHD45LFMexKXhk1rrtpPqevGgQumIee653dG5MwSB8FtflFY8p9+LSDm8mEMHXrgZQa6g0s1NzFcE/YVdjbO0BaHERm9NcbuKEzWJzUT2D9aIcKatdQKXm3Fc=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1783149746; c=relaxed/simple;
	bh=2mibyT6u8lxfR9C3nSt+zTgiCXVHQ5gKHQLx96uoCY4=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=hSDz+0Ihw6K+brW/65V2F+0WlCjcbeJLgmX58WBEFVduzY2IolpC/MWRcH2dElOT7UbfdL1BvkL0+UvePBYwK1EVXn5hFqQFHBiuPXo+im3YC7EP0ApZKoWutt0GdrkrH+CNQmABOEXiy3eyoAlmlK7IaNuDr1Nf3NPgkwGTRYU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=GCe5dXlm; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="GCe5dXlm"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1783149730;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=j8SP/it1btxtEa3nkt7kWlkY32XnT18+Vx7q9UYs3jo=;
	b=GCe5dXlm/GRmqJDzxE0Kz2eNTf+/KBmymepT1GcCKqwJJYgb2Lka3/Z8a2vEh7ANXOTgDh
	Qt9Ze5yneqQpA8MWsoBylZjaKEGcH0PvAXOfC2zeFLFPGzm5vBQZh7M7k7GtAHdN4EIOXX
	qevf78JuidPgKdmBjrq4Se/TkOEyD+U=
Received: from mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-686-dFdbBPYIPBuf7gKdzuOBgw-1; Sat,
 04 Jul 2026 03:22:09 -0400
X-MC-Unique: dFdbBPYIPBuf7gKdzuOBgw-1
X-Mimecast-MFC-AGG-ID: dFdbBPYIPBuf7gKdzuOBgw_1783149728
Received: from mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.4])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 590A01956047
	for <llvm@lists.linux.dev>; Sat,  4 Jul 2026 07:22:08 +0000 (UTC)
Received: from [172.20.209.159] (unknown [10.30.45.50])
	by mx-prod-int-01.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id DA63030030DF;
	Sat,  4 Jul 2026 07:22:07 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (7.2.0-rc1,
 upstream-mainline, 71dfdfb0)
Date: Sat, 04 Jul 2026 07:22:07 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.4
Message-Id: <12753.126070403220900270@us-mta-686.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: dpFuiVJsPDlHT_-65SI5pBlEfppHZGEriygJEuSLKOI_1783149728
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: OK
              Test: FAILED (Did not boot)


Kernel information:
    Commit message: Merge tag 'vfs-7.2-rc2.fixes' of git://git.kernel.org/p=
ub/scm/linux/kernel/git/vfs/vfs

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:2650717316

One or more kernel builds failed:
    Builds that are failing to boot:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:2650717316_ppc64le_kernel

One or more kernel tests failed:
    We also see the following known issues which are not related to your ch=
anges:
        Issue: [aarch64][coresight_etm4x][kernel 5.19.0] coresight-etm4x: p=
robe of ARMHC500:20 failed with error -17
            URL: https://lore.kernel.org/all/CA+QYu4ogiTa1V20aqxFqBrMH0z927=
YNNN2O=3DCKma+=3DM_8E81iQ@mail.gmail.com/
            Affected tests:
                Boot test [aarch64]
                Reboot test [aarch64]
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

