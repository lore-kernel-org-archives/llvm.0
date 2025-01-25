Received: from us-smtp-delivery-124.mimecast.com (us-smtp-delivery-124.mimecast.com [170.10.129.124])
	(using TLSv1.2 with cipher ECDHE-RSA-AES256-GCM-SHA384 (256/256 bits))
	(No client certificate requested)
	by smtp.subspace.kernel.org (Postfix) with ESMTPS id 13832CA4E
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 19:52:08 +0000 (UTC)
Authentication-Results: smtp.subspace.kernel.org; arc=none smtp.client-ip=170.10.129.124
ARC-Seal:i=1; a=rsa-sha256; d=subspace.kernel.org; s=arc-20240116;
	t=1737834730; cv=none; b=ZMfIqnSsdW6sx0HdH6DLuMVm+ClrRuzSLIWZAam5FFmSxYhg2OVnb7MVsCOE8zQ/oBHVMLlJfq+aOHigbWApo2S54aBA3u+FryxyBiOLFb/f3db9y7Nk+w+8DYieHyDchT8tEQmGcDu7wrBYEVoXWCrvazJIQiIYwaN7MqSC2mg=
ARC-Message-Signature:i=1; a=rsa-sha256; d=subspace.kernel.org;
	s=arc-20240116; t=1737834730; c=relaxed/simple;
	bh=IqK+Rc5hLKSCWKoUWuNoPJBNz+l6b6N+I6XmkumnKAo=;
	h=From:Subject:Date:To:MIME-Version:Message-Id:Content-Type; b=dddSvhzPKZAenlTrfBPGxGLJpLMEUFu0lMYTJxJHN6vI8KlAJ4XbJLA62tc7vapa3Tn4g41H4VMTSnQd88qLdzGYX5MrY39mHFW2T2YGdF3X4GrMtbL9eSfzUUTRSjwfHBxmm/dXtK4paQzTJiK6avsE0fJGZ7UZqw0BZ7igvJw=
ARC-Authentication-Results:i=1; smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com; spf=pass smtp.mailfrom=redhat.com; dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b=i3ij70oI; arc=none smtp.client-ip=170.10.129.124
Authentication-Results: smtp.subspace.kernel.org; dmarc=pass (p=none dis=none) header.from=redhat.com
Authentication-Results: smtp.subspace.kernel.org; spf=pass smtp.mailfrom=redhat.com
Authentication-Results: smtp.subspace.kernel.org;
	dkim=pass (1024-bit key) header.d=redhat.com header.i=@redhat.com header.b="i3ij70oI"
DKIM-Signature: v=1; a=rsa-sha256; c=relaxed/relaxed; d=redhat.com;
	s=mimecast20190719; t=1737834727;
	h=from:from:reply-to:subject:subject:date:date:message-id:message-id:
	 to:to:cc:mime-version:mime-version:content-type:content-type:
	 content-transfer-encoding:content-transfer-encoding;
	bh=gXfGs0nKp1v4xCIj2Siw9yN1qJqv9hxWhGFm5Iw2jwU=;
	b=i3ij70oIsnL4DIjUVv9lOhgVjEyqHsNUEdWhu46v1nv1KPfPEYjH4O2FKeEAN8oWY5V7pv
	R+wYycILNGLccM+u5RSo+1bc5ZAjQQ1+0iGUOLyUrFbV+Nh8mnUWtbLjPX34K1hcMRjPkl
	I6+9W3G7IkNov2D/ctZKlYF54qngbH4=
Received: from mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com
 (ec2-35-165-154-97.us-west-2.compute.amazonaws.com [35.165.154.97]) by
 relay.mimecast.com with ESMTP with STARTTLS (version=TLSv1.3,
 cipher=TLS_AES_256_GCM_SHA384) id us-mta-21-OJR1HbnPPwqhgRisjnlQCA-1; Sat,
 25 Jan 2025 14:52:05 -0500
X-MC-Unique: OJR1HbnPPwqhgRisjnlQCA-1
X-Mimecast-MFC-AGG-ID: OJR1HbnPPwqhgRisjnlQCA
Received: from mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com [10.30.177.111])
	(using TLSv1.3 with cipher TLS_AES_256_GCM_SHA384 (256/256 bits)
	 key-exchange X25519 server-signature RSA-PSS (2048 bits) server-digest SHA256)
	(No client certificate requested)
	by mx-prod-mc-06.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTPS id DCE6C18002A5
	for <llvm@lists.linux.dev>; Sat, 25 Jan 2025 19:52:04 +0000 (UTC)
Received: from [172.64.13.55] (unknown [10.30.32.164])
	by mx-prod-int-08.mail-002.prod.us-west-2.aws.redhat.com (Postfix) with ESMTP id 6B5851800348;
	Sat, 25 Jan 2025 19:52:04 +0000 (UTC)
From: cki-project@redhat.com
Subject: =?utf-8?b?4p2M?= FAIL: Test report for master (6.13.0,
 upstream-mainline, 40505771)
Date: Sat, 25 Jan 2025 19:52:04 -0000
To: llvm@lists.linux.dev
Precedence: bulk
X-Mailing-List: llvm@lists.linux.dev
List-Id: <llvm.lists.linux.dev>
List-Subscribe: <mailto:llvm+subscribe@lists.linux.dev>
List-Unsubscribe: <mailto:llvm+unsubscribe@lists.linux.dev>
MIME-Version: 1.0
X-Scanned-By: MIMEDefang 3.4.1 on 10.30.177.111
Message-Id: <46151.125012514520500525@us-mta-21.us.mimecast.lan>
X-Mimecast-Spam-Score: 0
X-Mimecast-MFC-PROC-ID: yjWcdAEmfeVaxBSmZLN8JzPJ9Qnoou7nRsulGpGvQsk_1737834725
X-Mimecast-Originator: redhat.com
Content-Type: text/plain; charset="utf-8"
Content-Transfer-Encoding: quoted-printable

Hi, we tested your kernel and here are the results:

    Overall result: FAILED
             Merge: OK
           Compile: FAILED


Kernel information:
    Commit message: Merge tag 'kgdb-6.14-rc1' of git://git.kernel.org/pub/s=
cm/linux/kernel/git/danielt/linux

You can find all the details about the test run at
    https://datawarehouse.cki-project.org/kcidb/checkouts/redhat:1640961323

One or more kernel builds failed:
    Unrecognized or new issues:
         ppc64le - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640961323-ppc64le-kernel
          x86_64 (debug) - https://datawarehouse.cki-project.org/kcidb/buil=
ds/redhat:1640961323-x86_64-kernel-debug
    We also see the following known issues which are not related to your ch=
anges:
          x86_64 - https://datawarehouse.cki-project.org/kcidb/builds/redha=
t:1640961323-x86_64-kernel
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

