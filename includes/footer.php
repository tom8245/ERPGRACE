<div class="footer fixed-bottom">
    <section class="footer-section">
        <div class="row">
            <div class="col-md-15 foot">
                <div class="link">
                    <a class="underline" href="https://www.gracecoe.org" target="_blank">Grace College of
                        Engineering , Mullakkadu ,Thoothukudi-05</a>
                </div>
                &copy; 2023 GRACE COLLEGE OF ENGINEERING | Project Done By :
                <a class="underline mlink" href="#">III BE CSE</a>
            </div>
        </div>
    </section>
    <!-- <meta name="viewport" content="width=device-width, initial-scale=1.0"> -->
</div>
<style>
    .link a {
        background: linear-gradient(0deg, blue, blue) no-repeat right bottom / 0 var(--bg-h);
        transition: background-size 350ms;
        --bg-h: 100%;
        text-decoration: none;
        font-size: 20px;
    }

    .link a:where(:hover, :focus-visible) {
        background-size: 100% var(--bg-h);
        background-position-x: left;
        color: blue;
    }

    .link .underline {
        padding-bottom: 2px;
        --bg-h: 2px;
    }

    .link a {
        color: black;
        line-height: 1;
    }

    a.underline:hover {
        color: blue;
    }

    .link {
        margin: 5px;
        font-size: 20px;
    }

    .mlink {
        color: blueviolet;
    }

    .foot {
        font-weight: 500;
        text-align: center;
    }

    .footer {
        border-top: 5px solid rgb(0, 0, 0);
        background-color: #f8f9fa;
        display: flex;
        align-content: center;
        justify-content: center;
        align-items: center;
        position: absolute;
        bottom: 0;
        width: -webkit-fill-available;
    }
</style>