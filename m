Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 3F4211C7011
	for <llvm@lists.linux.dev>; Sat, 15 Feb 2025 17:23:06 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1739640189; cv=none; b=Gd8jqUkqN+7aZhkSHLBy4aNOHbX8d+AdfsNfQAoTVN8IZl0LPRLgoiho/sJPXx6QpkhqP+MSCXUlNSqfpamW9PsicNcXOauwrSLoBnuJ/eRrYxzgfLXm0zRgEdzTXeHxMUfVSDcHMIYSlkJCy9BUYv3uqsovqQCP5fHHC66Tncw=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1739640189; c=relaxed/simple;
	bh=CfAjG1NavkGKxQ44+2+oMdRZIt4ulDt+ESw/aW8IGas=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=CPmHPstU5/bR3icINzbVgaj55ltLm1mviIBuG3TcF0DffTfbnxXYx9sHEi65+lmLnEZ7p33tfBsrx35yN+MAfOlcAf8Vag4radEwAPNzDLcclX5XHKtG4ebLa0Y6tg/hS1lJZ1AFrRzWSmbnwPFl6f1AxWIDqoqSsyHCDyrw7ts=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=E5qbLjO3; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="E5qbLjO3"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1739640186;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=NeoyVK4/88/iV/E0p9xDOLh5GzeAraP4gm66FkcinUM=;
	b=E5qbLjO30loGZBp41eiG0I0uvRwG0Oem3+0sDsA3b8y61daJAndR+oNe1t3bqUeuL+q3/y
	nvXIkRq6R0yrjXc4YggNqoXqqpF/n797iQ+qOsSq2vBAGtKIln2GBBbOFiBoXSbrdPVRN5
	kX8QWMHq/8x0MEXu2x3259Ia56stIro=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-413-38pvEZONNqm6SmYYFZTsgg-1; Sat,
 15 Feb 2025 12:23:04 -0500
X-MC-Unique: 38pvEZONNqm6SmYYFZTsgg-1
X-Mimecast-MFC-AGG-ID: 38pvEZONNqm6SmYYFZTsgg_1739640183
Received: from mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.93])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id 4040D18004A7
	for <llvm@lists.linux.dev>; Sat, 15 Feb 2025 17:23:03 +0000 (UTC)
Received: from [172.64.13.25] (unknown [10.30.32.164])
	by mx-prod-int-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id C58BF1800874;
	Sat, 15 Feb 2025 17:23:02 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.14.0-rc2,
 upstream-mainline, 6452feaf)
Date: Sat, 15 Feb 2025 17:23:02 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.93
Message-Id: <25017.125021512230400391@us-mta-413.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: SCGVX77yRxWPiTykp0zEczagJOKV6N1QGn12uuVVtIA_1739640183
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'gpio-fixes-for-v6.14-rc3-take2' of git://git=
.kernel.org/pub/scm/linux/kernel/git/brgl/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1672770105

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1672770105-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1672770105-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1672770105-x86_64-kernel
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

