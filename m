Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.133.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id C62C91AF0CE
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 10:23:14 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.133.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1742984597; cv=none; b=MAiYARw28vmwPsa2nVpT64l9w/c2rU/Be6o0L6tQd6rf+wsNrc6pHCqu98L+B56DtO2eQMb7IFedq8hE/Ry24UuJ5k5JwbLvpB/A00WgJ23todByFfgtJ7IKXLRiAXRfT+UIMky/2IlYkQErREXZBMI1sCoBbPu7jvabF8IB+I8=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1742984597; c=relaxed/simple;
	bh=3SS+Q5gJLOeDmj6fkWawn6e80cqmCPAQXGjFN3oCayc=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=Pp5++aCvHavYlVXpamMuKmPBpVk1TDIqzP+V3uaEWi9xK7HeAJ+jpJOdNXo0RQgSliUEdHjkKk3zZ3qxEJ4H5yJn0iRr8ugngSsMPYjNE7H1X1meYLiA+TDLDkgdophj9b4Su8EXxut1V/Uy3ezrxBqK6AMGVZCdI9FQuFwlBBU=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=NQRuDjwS; arc=none smtp.client-ip=170.10.133.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=quarantine dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="NQRuDjwS"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1742984593;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=mKxUejDaFNyMoK1yA96wTf6irCuNvdz5XfdlMoPMXmA=;
	b=NQRuDjwSF+k7k+v1p5oLfbqWghdq1rB0LKrPphLI4/eZxVo7r9tGQnlN/wfwkKmYEkKiDK
	OHLf37lW9NKrZTOWQzC8hqUudXno88A19x3n+XIKOQxbn6fDAP7/1TryKhSDNstlmQQhKA
	LFJ+aVhDsE7EgLKCAWGkiJSl5XkMF/8=
Received: from mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-54-186-198-63.us-west-2.compute.amazonaws.com [54.186.198.63]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-52-x0iY_6RmP6WCL_xtTG97TA-1; Wed,
 26 Mar 2025 06:23:12 -0400
X-MC-Unique: x0iY_6RmP6WCL_xtTG97TA-1
X-Mimecast-MFC-AGG-ID: x0iY_6RmP6WCL_xtTG97TA_1742984591
Received: from mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.40])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-02.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 7AD1219560B1
	for <llvm@lists.linux.dev>; Wed, 26 Mar 2025 10:23:11 +0000 (UTC)
Received: from [172.20.55.199] (unknown [10.30.45.42])
	by mx-prod-int-04.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id F418419560AB;
	Wed, 26 Mar 2025 10:23:10 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0,
 upstream-mainline, 47618bc8)
Date: Wed, 26 Mar 2025 10:23:10 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.0 on 10.30.177.40
Message-Id: <02924.125032606231200335@us-mta-52.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: IfX4u4av86_O-isk0sgqDC053Dclpr1J9-nREEBd3Uk_1742984591
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'spi-v6.15' of git://git.kernel.org/pub/scm/l=
inux/kernel/git/broonie/spi

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1735409889

One or more kernel builds failed:
    Unrecognized or new issues:
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1735409889-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1735409889-x86_64-kernel
                   Issue: Kernel build: arch/x86/tools/insn_decoder_test: e=
rror: malformed line
                          https://github.com/Rust-for-Linux/linux/issues/11=
34


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

